import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SavingDuration extends StatefulWidget {
  const SavingDuration({super.key});

  @override
  State<SavingDuration> createState() => SavingDurationState();
}

class SavingDurationState extends State<SavingDuration> {
  final _dateFormat = DateFormat("yyyy-MM-dd");
  late TextEditingController _startDateController;
  late TextEditingController _withdrawDateController;
  final _formKey = GlobalKey<FormState>();

  DateTime? _selectedStartDate;
  DateTime? _selectedWithdrawDate;

  @override
  void initState() {
    super.initState();
    _startDateController = TextEditingController();
    _withdrawDateController = TextEditingController();
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _withdrawDateController.dispose();
    super.dispose();
  }

  void submit() async {
    final start_date = _startDateController.value.text;
    final withdraw_date = _withdrawDateController.value.text;
    final prefs = await SharedPreferences.getInstance();
    final planString = prefs.getString('plan');

    if (planString != null) {
      Map<String, dynamic> plan = jsonDecode(planString);
      plan['start_date'] = start_date;
      plan['withdraw_date'] = withdraw_date;

      prefs.setString('plan', jsonEncode(plan)); // Update the stored plan

      print(plan);
    }

    // Navigate to the next screen (replace '/savings_complete' with the correct route)
    Navigator.pushNamed(context, "/plan_summary");
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            backgroundColor: const Color(0xFF2B5BBA),
            primaryColor:
                const Color(0xFF2B5BBA), // Set your desired color here
            accentColor: const Color(0xFF2B5BBA), // Set your desired color here
            // You can customize other properties of the theme as well
            // For example, you can change the background color using backgroundColor property.
            // For more customization options, refer to the ThemeData class documentation.
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedStartDate = pickedDate;
        _startDateController.text = _dateFormat.format(pickedDate);
      });
    }
  }

  Future<void> _selectWithdrawDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime afterMonth = currentDate.add(Duration(days: 30));

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: afterMonth,
      firstDate: afterMonth,
      lastDate: DateTime(2100),
      // firstDate: DateTime(1900),
      // lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedWithdrawDate = pickedDate;
        _withdrawDateController.text = _dateFormat.format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: ListView(
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 3 / 2,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: const Color(0xFF2B5BBA),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'SAVING DURATION',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "When would you like to start and stop saving?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Questrial',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.chevron_left),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Start date',
                        style: TextStyle(
                          color: Color(0xFF433D3D),
                          fontFamily: 'Questrial',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _startDateController,
                        onTap: () => _selectStartDate(context),
                        readOnly: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Select start date",
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
                          suffixIcon: const Icon(
                            Icons.calendar_month,
                            color: Color(0xFF9C9D9E),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'Withdraw date',
                        style: TextStyle(
                          color: Color(0xFF433D3D),
                          fontFamily: 'Questrial',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _withdrawDateController,
                        onTap: () => _selectWithdrawDate(context),
                        readOnly: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Select withdraw date",
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
                          suffixIcon: const Icon(
                            Icons.calendar_month,
                            color: Color(0xFF9C9D9E),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 250),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    submit();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B5BBA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
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
