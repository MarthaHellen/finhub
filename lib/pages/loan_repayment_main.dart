import 'package:flutter/material.dart';
import 'package:finhub/components/plan_summary_row.dart';
import 'package:finhub/components/loan_repayment_row.dart';

class LoanRepaymentMain extends StatefulWidget {
  LoanRepaymentMain({Key? key});

  @override
  State<LoanRepaymentMain> createState() => _LoanRepaymentMainState();
}

class _LoanRepaymentMainState extends State<LoanRepaymentMain> {
  String? selectedOption;
  bool recurring = false;
  final dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    selectedOption = "paid"; // Set the default value to true (Paid)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
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
                  const SizedBox(
                    width: 8.0,
                  ),
                  const Text(
                    'Loan Repayment',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF050901),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Breakdown of previous payments",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "This is the summary of your previous repayments",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF2B5BBA),
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFFE7E7E8),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const PlanSummaryRow(
                              keyText: "Amount taken",
                              valueText: "UXG 4,000,000"),
                          const SizedBox(height: 20),
                          const PlanSummaryRow(
                              keyText: "Amount payed",
                              valueText: "UGX 1,000,000"),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Balance",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "UGX 3,350,000",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF2B5BBA),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 170,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              //;
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2B5BBA),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Make payment',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: OutlinedButton(
                            onPressed: () {
                              _showLoanRepaymentReminderDialog(context);
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: const BorderSide(
                                color: Color(0xFF2B5BBA),
                              ),
                            ),
                            child: const Text(
                              'Set reminder',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF2B5BBA),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 27,
                              height: 27,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF2B5BBA),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Paid",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF433D3D),
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 27,
                              height: 27,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xFF828282),
                                  width: 2.0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Not Paid",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF433D3D),
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    LoanRepaymentRow(
                      dateText: 'Sep 25, 2023(Month 1)',
                      amountText: 'UGX 500,000',
                      type: 'paid',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LoanRepaymentRow(
                      dateText: 'Sep 25, 2023(Month 2)',
                      amountText: 'UGX 500,000',
                      type: 'paid',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LoanRepaymentRow(
                      dateText: 'Sep 25, 2023(Month 3)',
                      amountText: 'UGX 500,000',
                      type: 'paid',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LoanRepaymentRow(
                      dateText: 'Sep 25, 2023(Month 4)',
                      amountText: 'UGX 500,000',
                      type: 'not_paid',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LoanRepaymentRow(
                      dateText: 'Sep 25, 2023(Month 5)',
                      amountText: 'UGX 500,000',
                      type: 'not_paid',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LoanRepaymentRow(
                      dateText: 'Sep 25, 2023(Month 6)',
                      amountText: 'UGX 500,000',
                      type: 'not_paid',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LoanRepaymentRow(
                      dateText: 'Sep 25, 2023(Month 7)',
                      amountText: 'UGX 500,000',
                      type: 'not_paid',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LoanRepaymentRow(
                      dateText: 'Sep 25, 2023(Month 8)',
                      amountText: 'UGX 500,000',
                      type: 'not_paid',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LoanRepaymentRow(
                      dateText: 'Sep 25, 2023(Month 9)',
                      amountText: 'UGX 500,000',
                      type: 'not_paid',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LoanRepaymentRow(
                      dateText: 'Sep 25, 2023(Month 10)',
                      amountText: 'UGX 500,000',
                      type: 'not_paid',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLoanRepaymentReminderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white,
          contentPadding: const EdgeInsets.all(20),
          titlePadding: const EdgeInsets.all(20),
          insetPadding: const EdgeInsets.all(20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Loan repayment reminder',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Please set a reminder to ensure that you make payments on time. We shall be sending a notification to remind you',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF9C9D9E),
                  fontFamily: 'Questrial',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Date",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF433D3D),
                    fontFamily: 'Questrial',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: TextFormField(
                  cursorColor: const Color(0xFF4246B7),
                  keyboardType: TextInputType.datetime,
                  controller: dateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the date';
                    }

                    final currentDate = DateTime.now();
                    final enteredDate = DateTime.tryParse(value);

                    if (enteredDate == null) {
                      return 'Invalid date format';
                    }

                    if (enteredDate.isBefore(currentDate)) {
                      return 'Date must be today or a future date';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "DD-MM-YYYY",
                    hintStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF828282),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFCDCDCD)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(20),
                    suffixIcon: const Icon(
                      Icons.calendar_month,
                      color: Color(0xFF9C9D9E),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: recurring,
                    onChanged: (value) {
                      setState(() {
                        recurring = value!;
                      });
                    },
                    checkColor: Colors.white,
                    focusColor: const Color(0xFF2B5BBA),
                    activeColor: const Color(0xFF2B5BBA),
                  ),
                  const Flexible(
                    child: Text(
                      "Recurring reminders(Every month after the above date)",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF433D3D),
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 130,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        handleSubmit();
                        // Navigator.pop(context);
                        // _showReminderSuccessDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2B5BBA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 40,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDDE2EB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF828282),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  handleSubmit() {
    // if (_formKey.currentState!.validate()) {
    //   final date = dateController.value.text;
    //   Navigator.pop(context);
    //   _showReminderSuccessDialog(context);
    // }
    Navigator.pop(context);
    _showReminderSuccessDialog(context);
  }

  void _showReminderSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white,
          content: SizedBox(
            height: 423,
            width: 356,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'images/Verification-success.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Reminder Set Successfully',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF2B5BBA),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 349,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2B5BBA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color(0xFF4246B7),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
