import 'package:flutter/material.dart';

class CreateSavingAccount extends StatefulWidget {
  const CreateSavingAccount({super.key});

  @override
  State<CreateSavingAccount> createState() => _CreateSavingAccountState();
}

class _CreateSavingAccountState extends State<CreateSavingAccount> {
  bool _isLoading = false;

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
                // const SizedBox(width: 70,),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 30, left: 30, top: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'MEMBERSHIP FEE',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFF050901),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  "Start your financial journey with FinHub membership fee for only UGX 5,000",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF433D3D),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
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
                            'Pay Now',
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
    );
  }
}
