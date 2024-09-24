import 'package:flutter/material.dart';

class MakeEarlyRepayment extends StatefulWidget {
  MakeEarlyRepayment({Key? key});

  @override
  State<MakeEarlyRepayment> createState() => _MakeEarlyRepaymentState();
}

class _MakeEarlyRepaymentState extends State<MakeEarlyRepayment> {
  final bankNameController = TextEditingController();
  final amountToPayController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? selectedDurationType = 'Months';
  int selectedDuration = 1;
  double loanAmount = 0;

  final List<String> durationTypes = ['Months', 'Days', 'Years'];
  final List<int> durationValues = [1, 7, 12];

  void onDurationTypeChanged(String? newValue) {
    setState(() {
      selectedDurationType = newValue;
    });
  }

  void onDurationChanged(int newValue) {
    setState(() {
      selectedDuration = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
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
                  'Make Early Repayment',
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
                Form(
                  key: _formKey,
                  child: Container(
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Amount",
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
                            keyboardType: TextInputType.number,
                            controller: amountToPayController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the amount to pay';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                loanAmount = double.tryParse(value) ?? 0;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Amount to pay",
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
                            "Duration",
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
                        Row(
                          children: [
                            Expanded(
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: Theme.of(context)
                                      .colorScheme
                                      .copyWith(
                                          primary: const Color(0xFF2B5BBA)),
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  cursorColor: const Color(0xFF2B5BBA),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedDuration =
                                          int.tryParse(value) ?? 0;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: Theme.of(context)
                                      .colorScheme
                                      .copyWith(
                                          primary: const Color(0xFF2B5BBA)),
                                ),
                                child: DropdownButtonFormField<String>(
                                  value: selectedDurationType,
                                  items: durationTypes.map((String type) {
                                    return DropdownMenuItem<String>(
                                      value: type,
                                      child: Text(
                                        type,
                                        style: const TextStyle(
                                          fontFamily: 'Questrial',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFBCBBBB),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: onDurationTypeChanged,
                                  focusColor: const Color(0xFF2B5BBA),
                                ),
                              ),
                            ),
                          ],
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
                    .pushReplacementNamed('/payment_method');
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
