import 'package:flutter/material.dart';

class PreviousSavings extends StatefulWidget {
  const PreviousSavings({Key? key}) : super(key: key);

  @override
  State<PreviousSavings> createState() => PreviousSavingsState();
}

class PreviousSavingsState extends State<PreviousSavings> {
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
                                'PREVIOUS SAVINGS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 30,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                              color: Color(0xFFE7E7E8), width: 1.0),
                        ),
                      ),
                      child: ListTile(
                        tileColor: Colors.white,                        
                        title: Row(
                          children: const [
                            Text(
                              'Thur, 5th May 2023',
                              style: TextStyle(
                                color: Color(0xFF433D3D),
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'UGX 100,000',
                              style: TextStyle(
                                color: Color(0xFF433D3D),
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        subtitle: const Text(
                          "Plan name 1",
                          style: TextStyle(
                            color: Color(0xFF9C9D9E),
                            fontSize: 15,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                              color: Color(0xFFE7E7E8), width: 1.0),
                        ),
                      ),
                      child: ListTile(
                        tileColor: Colors.white,                        
                        title: Row(
                          children: const [
                            Text(
                              'Thur, 5th May 2023',
                              style: TextStyle(
                                color: Color(0xFF433D3D),
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'UGX 100,000',
                              style: TextStyle(
                                color: Color(0xFF433D3D),
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        subtitle: const Text(
                          "Plan name 1",
                          style: TextStyle(
                            color: Color(0xFF9C9D9E),
                            fontSize: 15,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                              color: Color(0xFFE7E7E8), width: 1.0),
                        ),
                      ),
                      child: ListTile(
                        tileColor: Colors.white,                        
                        title: Row(
                          children: const [
                            Text(
                              'Thur, 5th May 2023',
                              style: TextStyle(
                                color: Color(0xFF433D3D),
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'UGX 100,000',
                              style: TextStyle(
                                color: Color(0xFF433D3D),
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        subtitle: const Text(
                          "Plan name 3",
                          style: TextStyle(
                            color: Color(0xFF9C9D9E),
                            fontSize: 15,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                              color: Color(0xFFE7E7E8), width: 1.0),
                        ),
                      ),
                      child: ListTile(
                        tileColor: Colors.white,                        
                        title: Row(
                          children: const [
                            Text(
                              'Thur, 5th May 2023',
                              style: TextStyle(
                                color: Color(0xFF433D3D),
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'UGX 100,000',
                              style: TextStyle(
                                color: Color(0xFF433D3D),
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        subtitle: const Text(
                          "Plan name 2",
                          style: TextStyle(
                            color: Color(0xFF9C9D9E),
                            fontSize: 15,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
