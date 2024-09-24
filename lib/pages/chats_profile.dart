import 'package:flutter/material.dart';

class ChatsProfile extends StatelessWidget {
  const ChatsProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            color: const Color(0xFF2B5BBA),
            padding: const EdgeInsets.only(top: 20, left: 20, bottom: 30),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
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
                Column(
                  children: [
                    Container(
                      width: 86,
                      height: 86,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('images/face.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Josephine',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      'online',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'images/phone.png',
                          height: 24,
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          'Phone',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff433D3D),
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '077093663',
                      style: TextStyle(
                        color: Color(0xff2B5BBA),
                        fontSize: 18,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'images/university.png',
                          height: 24,
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          'University',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff433D3D),
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'Makerere',
                      style: TextStyle(
                        color: Color(0xff2B5BBA),
                        fontSize: 18,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'images/collage.png',
                          height: 24,
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          'Collage',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff433D3D),
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'Cocis',
                      style: TextStyle(
                        color: Color(0xff2B5BBA),
                        fontSize: 18,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
