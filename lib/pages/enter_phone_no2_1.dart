import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EnterPhoneNumber2 extends StatefulWidget {
  const EnterPhoneNumber2({super.key});

  @override
  State<EnterPhoneNumber2> createState() => _EnterPhoneNumber2State();
}

class _EnterPhoneNumber2State extends State<EnterPhoneNumber2> {
  bool _isLoading = false;
  final phoneNumberController = TextEditingController();
  String selectedCurrency = "UGX";
  int initiatingFee = 5000;
  final _formKey = GlobalKey<FormState>();

  Future<void> _sendMoney() async {
    if (_formKey.currentState!.validate()) {
      String baseUrl = "http://localhost:4040";
      String transactionRequestId = "b51ec534-ee48-4575-b6a9-ead2955b8069";

      String recipientNumber = phoneNumberController.text;
      int amount = initiatingFee;

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

      var url = Uri.parse(
          '$baseUrl/thirdpartyTransaction/$transactionRequestId/initiate');
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
              "payee": {
                "partyIdType": payeeIdType,
                "partyIdentifier": payeeNumber
              }
            }),
          );
          if (partyLookupResponse.statusCode == 200) {
            Map<String, dynamic> partyLookupResponseDetails =
                jsonDecode(partyLookupResponse.body);
            String payeeName = partyLookupResponseDetails["party"]["name"];

            // ignore: use_build_context_synchronously
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  actionsPadding: const EdgeInsets.all(20),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  titlePadding: const EdgeInsets.only(top: 20),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: const Text(
                    "Confirm Payment",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFF2B5BBA),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Payment initiated by Merchant: $payeeName",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF433D3D),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Recipient Number: $recipientNumber",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF433D3D),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Amount: $amount $selectedCurrency",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF433D3D),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
                          Navigator.pop(
                              context); // Close the confirmation dialog

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                actionsPadding: const EdgeInsets.all(20),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                titlePadding: EdgeInsets.all(20),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                title: const Text(
                                  "Congratulations!",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xFF2B5BBA),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                content: const Text(
                                  "Payment successful.",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF433D3D),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        context), // Close the success dialog
                                    child: const Text(
                                      "OK",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF2B5BBA),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                actionsPadding: const EdgeInsets.all(20),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                titlePadding: EdgeInsets.only(top: 20),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                title: const Text(
                                  "Oops!",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xFF2B5BBA),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                content: const Text(
                                  "Something went wrong. Please check your internet connection and try again",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF433D3D),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        context), // Close the success dialog
                                    child: const Text(
                                      "OK",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF2B5BBA),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: const Text(
                        "Confirm",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF2B5BBA),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(
                          context), // Close the confirmation dialog
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF433D3D),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        }
      } catch (e) {
        print('Error: $e');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              actionsPadding: const EdgeInsets.all(20),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              titlePadding: EdgeInsets.only(top: 20),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text(
                "Oops!",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF2B5BBA),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              content: const Text(
                "Something went wrong. Please check your internet connection and try again",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF433D3D),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () =>
                      Navigator.pop(context), // Close the success dialog
                  child: const Text(
                    "OK",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF2B5BBA),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 20,
                left: 20,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF2B5BBA).withOpacity(0.29),
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: Colors.black,
                      ),
                    ),
                    // const SizedBox(width: 70,),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 30, left: 30, top: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enter Phone number',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF050901),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      "Please enter your mobile account number",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF433D3D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Phone Number",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF433D3D),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        cursorColor: const Color(0xFF4246B7),
                        controller: phoneNumberController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "e.g 0770000000",
                          hintStyle: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFF828282),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFD9D9D9)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFCDCDCD)),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.all(20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 349,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isLoading = true;
                          });
                          // Simulating verification process
                          Future.delayed(const Duration(seconds: 2), () {
                            _sendMoney();
                            setState(() {
                              _isLoading = false;
                            });
                            //Navigator.pushNamed(context, "/congratulations");
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2B5BBA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Proceed',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
