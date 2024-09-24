import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finhub/pages/student_provider.dart';
import 'package:finhub/firebase_auth/auth.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PlanPay extends StatefulWidget {
  const PlanPay({super.key});

  @override
  State<PlanPay> createState() => _PlanPayState();
}

class _PlanPayState extends State<PlanPay> {
  bool _isLoading = false;
  final phoneNumberController = TextEditingController();
  final amountToSaveController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void pay() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedPlanId = prefs.getString('selectedPlanId') ?? '';
    setState(() {
      _isLoading = true;
    });
    final planRef =
        FirebaseFirestore.instance.collection('plans').doc(selectedPlanId);

    try {
      // Fetch the document data first
      DocumentSnapshot snapshot = await planRef.get();

      if (snapshot.exists) {
        Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
        int currentAmountSaved = (data?['amount_saved'] ?? 0) as int;

        // Update the 'amount_saved' field by adding the new value
        await planRef.update({
          'amount_saved':
              currentAmountSaved + int.parse(amountToSaveController.value.text),
        });
        // Navigate to congratulations page
        Navigator.pushNamed(context, "/congratulations");
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error updating document: $e');
    }

    await prefs.remove('selectedPlanId');
    await prefs.remove('save');
  }

  Future<void> _sendMoney() async {
    if (_formKey.currentState!.validate()) {
      String baseUrl = "http://localhost:4040";
      String transactionRequestId = "b51ec534-ee48-4575-b6a9-ead2955b8069";

      String recipientNumber = phoneNumberController.text;
      String selectedCurrency = "UGX";

      try {
        var partyLookupResponse = await http.post(
          Uri.parse('$baseUrl/thirdpartyTransaction/partyLookup'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "transactionRequestId": "b51ec534-ee48-4575-b6a9-ead2955b8069",
            "payee": {"partyIdType": "MSISDN", "partyIdentifier": "16135551212"}
          }),
        );
        if (partyLookupResponse.statusCode == 200) {
          Map<String, dynamic> partyLookupResponseDetails =
              jsonDecode(partyLookupResponse.body);
          print(partyLookupResponse.body);
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
          var initiateResponse = await http.post(
            url,
            body: payload,
            headers: {'Content-Type': 'application/json'},
          );

          if (initiateResponse.statusCode == 200) {
            print(initiateResponse.body);
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
                        "Recipient Number: $recipientNumber",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF433D3D),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Amount: ${int.parse(amountToSaveController.value.text)} $selectedCurrency",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF433D3D),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        cursorColor: const Color(0xFF4246B7),
                        decoration: InputDecoration(
                          hintText: "Enter PIN",
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
                          contentPadding: EdgeInsets.all(20),
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
                          print(approveResponse.body);
                          Navigator.pop(
                              context); // Close the confirmation dialog

                          pay();
                        } else {
                          // ignore: use_build_context_synchronously
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
                top: 30,
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
              Form(
                key: _formKey,
                child: Container(
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
                            fontWeight: FontWeight.w400),
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
                      TextFormField(
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
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Amount",
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
                      TextFormField(
                        cursorColor: const Color(0xFF4246B7),
                        keyboardType: TextInputType.number,
                        controller: amountToSaveController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your amount to save';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "eg 40000",
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
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 349,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            _sendMoney();
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
