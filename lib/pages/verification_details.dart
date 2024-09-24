import 'package:flutter/material.dart';

class VerificationDetails extends StatefulWidget {
  VerificationDetails({Key? key});

  @override
  State<VerificationDetails> createState() => _VerificationDetailsState();
}

class _VerificationDetailsState extends State<VerificationDetails> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: ListView(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 20,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                        const SizedBox(width: 8.0),
                        const Text(
                          'Verification Details',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF050901),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "images/edit2.png",
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 30, left: 30, top: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      width: 100,
                      height: 100,
                      decoration:  const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('images/Verification-success.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Account Status',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF050901),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  const Text(
                    "Unverified",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFF43A3A),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFE7E7E8),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          //
                        },
                        child: ListTile(
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          leading: const Icon(
                            Icons.account_balance_wallet,
                            color: Color(0xFF9C9D9E),
                          ),
                          title: Row(
                            children: const [
                              Text(
                                'Required Information',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'View',
                                style: TextStyle(
                                  color: Color(0xFF2B5BBA),
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          subtitle: const Text(
                            "Regulation Requirements",
                            style: TextStyle(
                              color: Color(0xFF9C9D9E),
                              fontSize: 15,
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFE7E7E8),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          //
                        },
                        child: ListTile(
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          leading: const Icon(
                            Icons.account_balance_wallet,
                            color: Color(0xFF9C9D9E),
                          ),
                          title: Row(
                            children: const [
                              Text(
                                'Upload Documents',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'View',
                                style: TextStyle(
                                  color: Color(0xFF2B5BBA),
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          subtitle: const Text(
                            "Upload Proof of Identity",
                            style: TextStyle(
                              color: Color(0xFF9C9D9E),
                              fontSize: 15,
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
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
