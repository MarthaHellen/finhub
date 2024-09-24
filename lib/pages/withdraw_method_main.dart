import 'package:flutter/material.dart';

class WithdrawMethod extends StatefulWidget {
  const WithdrawMethod({super.key});

  @override
  State<WithdrawMethod> createState() => _WithdrawMethodState();
}

class _WithdrawMethodState extends State<WithdrawMethod> {
  bool _isLoading = false;
  String? selectedOption;
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20, left: 20, top: 30),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Withdraw Method',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFF050901),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Choose the withdrawal method",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF433D3D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  title: const Text(
                    "Bank",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF433D3D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                  ),
                  leading: Transform.scale(
                    scale: 1.25,
                    child: Radio(
                      value: 'make_payment',
                      focusColor: const Color(0xFF2B5BBA),
                      activeColor: const Color(0xFF2B5BBA),
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text(
                    "Mobile Money Top Up",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF433D3D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                  ),
                  leading: Transform.scale(
                    scale: 1.25,
                    child: Radio(
                      value: 'mobile_money',
                      focusColor: const Color(0xFF2B5BBA),
                      activeColor: const Color(0xFF2B5BBA),
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            child: Container(
              width: 349,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                  });
                  if (selectedOption == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select an option'),
                      ),
                    );
                    setState(() {
                      _isLoading = false;
                    });
                  } else if (selectedOption == 'mobile_money') {
                    Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        setState(() {
                          _isLoading = false;
                        });
                        Navigator.pushNamed(context, '/mobile_money_topup');
                      },
                    );
                  }
                  else {
                    Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        setState(() {
                          _isLoading = false;
                        });
                        Navigator.pushNamed(context, '/make_payment');
                      },
                    );
                  }
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
          ),
        ],
      ),
    );
  }
}
