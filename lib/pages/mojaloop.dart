import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SendMoneyScreen extends StatefulWidget {
  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String selectedCurrency = "USD";

  Future<void> _sendMoney() async {
    String baseUrl = "http://localhost:4040";
    String transactionRequestId = "b51ec534-ee48-4575-b6a9-ead2955b8069";

    String recipientNumber = phoneNumberController.text;
    double amount = double.parse(amountController.text);

    Map<String, dynamic> requestPayload = {
      "payee": {
        "name": "Bob bobbington",
        "partyIdInfo": {
          "fspId": "dfspb",
          "partyIdType": "MSISDN",
          "partyIdentifier": "16135551212"
        }
      },
      "payer": {
        "partyIdType": "THIRD_PARTY_LINK",
        "partyIdentifier": "16135551212",
        "fspId": "dfspa"
      },
      "amountType": "RECEIVE",
      "amount": {"currency": "USD", "amount": "123.47"},
      "transactionType": {
        "scenario": "DEPOSIT",
        "initiator": "PAYER",
        "initiatorType": "CONSUMER"
      },
      "expiration": "2021-05-24T08:38:08.699-04:00"
    };

    var payload = jsonEncode(requestPayload);

    var url = Uri.parse('$baseUrl/thirdpartyTransaction/$transactionRequestId/initiate');

    try {
      var initiateResponse = await http.post(
        url,
        body: payload,
        headers: {'Content-Type': 'application/json'},
      );

      if (initiateResponse.statusCode == 200) {
        Map<String, dynamic> payeeDetails = jsonDecode(initiateResponse.body);
        String payeeNumber = payeeDetails["authorization"]["payee"]
            ["partyIdInfo"]["partyIdentifier"];
        String payeeIdType = payeeDetails["authorization"]["payee"]
            ["partyIdInfo"]["partyIdType"];
        String amountToSend =
            payeeDetails["authorization"]["transferAmount"]["amount"];
        String currencyToSend =
            payeeDetails["authorization"]["transferAmount"]["currency"];

        var partyLookupResponse = await http.post(
          Uri.parse('$baseUrl/thirdpartyTransaction/partyLookup'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "transactionRequestId": "b51ec534-ee48-4575-b6a9-ead2955b8069",
            "payee": {"partyIdType": payeeIdType, "partyIdentifier": payeeNumber}
          }),
        );
        if (partyLookupResponse.statusCode == 200) {
          Map<String, dynamic> partyLookupResponseDetails =
              jsonDecode(partyLookupResponse.body);
          String payeeName = partyLookupResponseDetails["party"]["name"];

          AlertDialog(
            title: Text("Confirm Payment"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Payment initiated by Merchant: $payeeName"),
                Text("Recipient Number: $recipientNumber"),
                Text("Amount: $amount $selectedCurrency"),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  var approveResponse = await http.post(
                    Uri.parse(
                        '$baseUrl/thirdpartyTransaction/$transactionRequestId/approve'),
                    headers: {'Content-Type': 'application/json'},
                    body: jsonEncode({
                      "authorizationResponse": {
                        "responseType": "ACCEPTED",
                        "signedPayload": {
                          "signedPayloadType": "FIDO",
                          "fidoSignedPayload": {
                            "id":
                                "45c-TkfkjQovQeAWmOy-RLBHEJ_e4jYzQYgD8VdbkePgM5d98BaAadadNYrknxgH0jQEON8zBydLgh1EqoC9DA",
                            "rawId":
                                "45c+TkfkjQovQeAWmOy+RLBHEJ/e4jYzQYgD8VdbkePgM5d98BaAadadNYrknxgH0jQEON8zBydLgh1EqoC9DA==",
                            "response": {
                              "authenticatorData":
                                  "SZYN5YgOjGh0NBcPZHZgW4/krrmihjLHmVzzuoMdl2MBAAAACA==",
                              "clientDataJSON":
                                  "eyJ0eXBlIjoid2ViYXV0aG4uZ2V0IiwiY2hhbGxlbmdlIjoiQUFBQUFBQUFBQUFBQUFBQUFBRUNBdyIsIm9yaWdpbiI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIxODEiLCJjcm9zc09yaWdpbiI6ZmFsc2UsIm90aGVyX2tleXNfY2FuX2JlX2FkZGVkX2hlcmUiOiJkbyBub3QgY29tcGFyZSBjbGllbnREYXRhSlNPTiBhZ2FpbnN0IGEgdGVtcGxhdGUuIFNlZSBodHRwczovL2dvby5nbC95YWJQZXgifQ==",
                              "signature":
                                  "MEUCIDcJRBu5aOLJVc/sPyECmYi23w8xF35n3RNhyUNVwQ2nAiEA+Lnd8dBn06OKkEgAq00BVbmH87ybQHfXlf1Y4RJqwQ8="
                            },
                            "type": "public-key"
                          }
                        }
                      }
                    }),
                  );

                  if (approveResponse.statusCode == 200) {
                    Navigator.pop(context); // Close the confirmation dialog
                    AlertDialog(
                      title: Text("Congratulations!"),
                      content: Text("Payment successful."),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(
                              context), // Close the success dialog
                          child: Text("OK"),
                        ),
                      ],
                    );
                  } else {
                    AlertDialog(
                      title: Text("Oops!"),
                      content: Text("Something went wrong."),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(
                              context), // Close the success dialog
                          child: Text("OK"),
                        ),
                      ],
                    );
                  }
                },
                child: const Text("Confirm"),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pop(context), // Close the confirmation dialog
                child: const Text("Cancel"),
              ),
            ],
          );
        }
      }
    } catch (e) {
      print('Error: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Oops!"),
            content: Text("Something went wrong."),
            actions: [
              TextButton(
                onPressed: () =>
                    Navigator.pop(context), // Close the success dialog
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Loan Money'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Recipient Phone Number'),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            DropdownButtonFormField<String>(
              value: selectedCurrency,
              items: ['USD', 'UGX', 'EUR'].map((currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value!;
                });
              },
            ),
            ElevatedButton(
              onPressed: _sendMoney,
              child: Text('Send Money'),
            ),
          ],
        ),
      ),
    );
  }
}
