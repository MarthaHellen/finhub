import 'package:finhub/components/inquiries.dart';
import 'package:flutter/material.dart';
import 'package:finhub/components/faqs.dart';

class FaqsInquiries extends StatefulWidget {
  FaqsInquiries({Key? key});

  @override
  State<FaqsInquiries> createState() => _FaqsInquiriesState();
}

class _FaqsInquiriesState extends State<FaqsInquiries> {
  int selectedIndex =
      0; // Keeps track of the selected index (0 for FAQs, 1 for Inquiries)
  

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
                      'FAQs & Inquiries',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF050901),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = 0;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: selectedIndex == 0
                                        ? const Color(0xFF2B5BBA)
                                        : const Color(0xFFEDEDED),
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Text(
                                "FAQs",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: selectedIndex == 0
                                      ? const Color(0xFF2B5BBA)
                                      : const Color(0xFF433D3D),
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = 1;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: selectedIndex == 1
                                        ? const Color(0xFF2B5BBA)
                                        : const Color(0xFFEDEDED),
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Text(
                                "Inquiries",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: selectedIndex == 1
                                      ? const Color(0xFF2B5BBA)
                                      : const Color(0xFF433D3D),
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    selectedIndex == 0
                        ? const FAQS()
                        : const Inquiries(),
                    const SizedBox(
                      height: 50,
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
