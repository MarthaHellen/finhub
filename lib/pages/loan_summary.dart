import 'package:flutter/material.dart';

class LoanSummary extends StatefulWidget {
  LoanSummary({Key? key});

  @override
  State<LoanSummary> createState() => _LoanSummaryState();
}

class _LoanSummaryState extends State<LoanSummary> {
  final bankNameController = TextEditingController();
  final loanPurposeController = TextEditingController();
  final accountNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String selectedValue = 'Centenary Bank';
  List<String> banks = [
    'Bank of Uganda',
    'ABC Capital Bank',
    'Bank of Africa',
    'Bank of Baroda',
    'Barclays Bank',
    'Cairo International Bank',
    'Centenary Bank',
    'Citibank Uganda Limited',
    'DFCU Bank',
    'Diamond Trust Bank',
    'Ecobank Uganda',
    'Equity Bank',
    'GT Bank',
    'Finance Trust Bank',
    'Housing Finance Bank',
    'Imperial Bank Uganda',
    'KCB Bank',
    'NC Bank Uganda',
    'Orient Bank',
    'Stanbic Bank',
    'Standard Chartered Bank',
    'Tropical Bank',
    'UBA Bank',
  ];

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
                    const SizedBox(
                      width: 8.0,
                    ),
                    const Text(
                      'Loan Summary',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF050901),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 30, left: 30, top: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Submit Loan request',
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFF050901),
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Fill in the purpose of the loan and your bank and wait for confirmation",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF828282),
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Purpose of the loan",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF433D3D),
                                    fontFamily: 'Questrial',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: TextFormField(
                                cursorColor: const Color(0xFF4246B7),
                                controller: loanPurposeController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your purpose';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Color(0xFFD9D9D9)),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFCDCDCD)),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: const EdgeInsets.all(20),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Name of Bank",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF433D3D),
                                    fontFamily: 'Questrial',
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
                                      color: Color(0xFFEBEBEB)),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF433D3D),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValue = newValue!;
                                    });
                                  },
                                  items: banks.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontFamily: 'Questrial',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFFBCBBBB),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Account Number",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF433D3D),
                                    fontFamily: 'Questrial',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: TextFormField(
                                cursorColor: const Color(0xFF4246B7),
                                controller: accountNumberController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter account number';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Color(0xFFD9D9D9)),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFCDCDCD)),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: const EdgeInsets.all(20),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
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
      persistentFooterButtons: [
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
                Navigator.of(context)
                    .pushReplacementNamed('/successful_screen');
                setState(() {
                  //
                });
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
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
