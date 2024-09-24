import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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

  QRViewController? _qrController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  

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
            margin: const EdgeInsets.only(right: 30, left: 30, top: 20),
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
                    "QR Code",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF433D3D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                  ),
                  leading: Transform.scale(
                    scale: 1.25,
                    child: Radio(
                      value: 'qr_code',
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
                    "Mobile Money",
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
          Visibility(
            visible: selectedOption == 'qr_code',
            child: Positioned(
              top: 200,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
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
                        Navigator.pushNamed(context, '/enter_amount');
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

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _qrController = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      _qrController?.pauseCamera();
      _processScannedQRCode(scanData.code!);
    });
  }

  void _processScannedQRCode(String qrCode) {
    // Handle the scanned QR code here
    if (qrCode == "desired_qr_code") {
      Navigator.pushNamed(context, '/bank_details');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid QR code.'),
        ),
      );
      _qrController?.resumeCamera();
    }
  }

  @override
  void dispose() {
    _qrController?.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: WithdrawMethod(),
  ));
}
