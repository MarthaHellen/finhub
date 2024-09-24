import 'package:flutter/material.dart';

class Badges extends StatefulWidget {
  const Badges({super.key});

  @override
  State<Badges> createState() => _BadgesState();
}

class _BadgesState extends State<Badges> {
  bool reward = false;

  @override
  Widget build(BuildContext context) {
    return reward
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 163,
                height: 85,
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/gold-2.png',
                      height: 70,
                      width: 50,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'GOLD',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFC88B33),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '42 points',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFCDCDCD),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Total Points',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF433D3D),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '42',
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2B5BBA),
                    ),
                  ),
                ],
              )
            ],
          )
        : Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.asset(
                  'images/Group.png',
                  height: 100.0,
                ),
                const Text(
                  "No Badge",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFCDCDCD),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
  }
}
