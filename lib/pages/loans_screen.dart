import 'package:flutter/material.dart';
import 'package:finhub/components/loans_screen_card.dart';

class LoansScreen extends StatefulWidget {
  const LoansScreen({Key? key}) : super(key: key);

  @override
  State<LoansScreen> createState() => _LoansScreenState();
}

class _LoansScreenState extends State<LoansScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 205,
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Color(0xFF2B5BBA),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 20),
                    Text(
                      'Hello Josephine',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'You have no loan so far',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -50,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    // custom card
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(20.0),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Loan balance",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFA0A0A0),
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Monthly payments",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFA0A0A0),
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF2B5BBA),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "UGX 0.00",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontFamily: 'Questrial',
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF2B5BBA),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "UGX 0.00",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: 'Questrial',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 90,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.00),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Quick Links",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF2B5BBA),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    LoansScreenCard(
                      color: Color(0xFF02AF71),
                      dotColor: Color(0xFF02C17D),
                      imageUrl: "images/emptywallettick.png",
                      text: "Apply for Loan",
                      route: "/loan_packages",
                    ),
                    LoansScreenCard(
                      color: Color(0xFFD158FC),
                      dotColor: Color(0xFFE597F9),
                      imageUrl: "images/walletmoney.png",
                      text: "Loan Payment",
                      route: "/loan_repayment_main",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    LoansScreenCard(
                      color: Color(0xFF2B5BBA),
                      dotColor: Color(0xFF1C4CAA),
                      imageUrl: "images/moneyrecive.png",
                      text: "Early Repayment",
                      route: "/make_early_repayment",
                    ),
                    LoansScreenCard(
                      color: Color(0xFFABBCDC),
                      dotColor: Color(0xFFCCDBF8),
                      imageUrl: "images/pictureframe.png",
                      text: "Loan Breakdown",
                      route: "/loan_breakdown",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.00),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Loan History",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF2B5BBA),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
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
                            'Loan Approval',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'View Details',
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
                        "The loan you applied for is waiting for approval",
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
                const SizedBox(
                  height: 10,
                ),
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
                      Navigator.of(context)
                          .pushReplacementNamed('/loan_received');
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
                            'Loan Received',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'View Details',
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
                        "You received a loan of UGX 400,000",
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
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DottedBackgroundPainter extends CustomPainter {
  final Color dotColor;
  final Color backgroundColor;
  final double dotRadius;

  DottedBackgroundPainter({
    required this.dotColor,
    required this.backgroundColor,
    required this.dotRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = backgroundColor;
    final dotPaint = Paint()..color = dotColor;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      backgroundPaint,
    );

    canvas.drawCircle(const Offset(10, 10), dotRadius, dotPaint);
  }

  @override
  bool shouldRepaint(DottedBackgroundPainter oldDelegate) {
    return dotColor != oldDelegate.dotColor ||
        backgroundColor != oldDelegate.backgroundColor ||
        dotRadius != oldDelegate.dotRadius;
  }
}
