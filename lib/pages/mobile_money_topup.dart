import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finhub/firebase_auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MobileMoneyTopUp extends StatefulWidget {
  const MobileMoneyTopUp({Key? key});

  @override
  State<MobileMoneyTopUp> createState() => _MobileMoneyTopUpState();
}

class _MobileMoneyTopUpState extends State<MobileMoneyTopUp> {
  bool _isLoading = false;
  final amountController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String selectedValue = '';
  List<String> plans = [];
  late String selectedPlanId;

  @override
  void initState() {
    super.initState();
    _fetchPlans();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await getStudentId(); // Wait for getStudentId() to complete
    
  }

  Future<void> _fetchPlans() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('plans')
        .where('account_status', isEqualTo: "Unlocked")
        .get();
    setState(() {
      plans = snapshot.docs
          .map<String>((doc) => doc['plan_name'] as String)
          .toList();
      if (plans.isNotEmpty) {
        selectedValue = plans.first;
        selectedPlanId = snapshot.docs.first.id;
      }
    });
  }

  String? userId;

  Future<void> getStudentId() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('students')
              .where('email', isEqualTo: user.email)
              .get();
      print(user.email);
      if (snapshot.size > 0) {
        final DocumentSnapshot<Map<String, dynamic>> studentDoc =
            snapshot.docs.first;
        userId = studentDoc.id;
        print(studentDoc);
        print(studentDoc.id);
        print(userId);
      }
    }else{
      userId = null; 
    }
  }

  void withdraw() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _isLoading = true;
    });
    try {
      final planRef =
          FirebaseFirestore.instance.collection('plans').doc(selectedPlanId);
      final CollectionReference withdrawCollection =
        FirebaseFirestore.instance.collection('withdraw');


          // Create a corresponding "withdraw" document
      DocumentReference withdrawDocRef = await withdrawCollection.add({
        'withdraw_date': DateTime.now(),
        'withdraw_amount': int.parse(amountController.text),
        'plan_id': selectedPlanId,
        'student_id': userId,
      });

      // Fetch the document data first
      DocumentSnapshot snapshot = await planRef.get();

      if (snapshot.exists) {
        Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

        if (data != null) {
          int currentAmountSaved = (data['amount_saved'] ?? 0) as int;

          // Update the 'amount_saved' field by subtracting the new value
          await planRef.update({
            'amount_saved':
                currentAmountSaved - int.parse(amountController.text),
          });

          await planRef.update({
            'amount_saved':
                currentAmountSaved - int.parse(amountController.text),
          });

          // Navigate to congratulations page
          Navigator.pushNamed(context, "/congratulations");
        } else {
          print('Data is null');
        }
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error updating document: $e');
    }

    await prefs.remove('selectedPlanId');
    await prefs.remove('save');

    setState(() {
      _isLoading = false;
    });
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
            Map<String, dynamic> partyLookupResponseDetails =
                jsonDecode(partyLookupResponse.body);

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
                    "Confirm Withdraw",
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
                        "Phone Number: $recipientNumber",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF433D3D),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Amount: ${int.parse(amountController.value.text)} $selectedCurrency",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF433D3D),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Plan: $selectedValue",
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

                          withdraw();
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
                          'Mobile Money Top Up',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFF050901),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Text(
                        "Please enter the number, amount and select a plan",
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
                          hintText: "0770000000",
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
                      const SizedBox(
                        height: 15,
                      ),
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
                        keyboardType: TextInputType.number,
                        cursorColor: const Color(0xFF4246B7),
                        controller: amountController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the amount';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "5000",
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
                      const SizedBox(
                        height: 30,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Choose Plan",
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
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFD9D9D9)),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(5),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedValue,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Color(0xFF828282)),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF828282),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                            items: plans
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF828282),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
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
