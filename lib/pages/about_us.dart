import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
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
                      const SizedBox(width: 8.0),
                      const Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF050901),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'images/finhub_icon.png',
                    fit: BoxFit.contain,
                    height: 120,
                    // Adjust the height as needed
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'FIN',
                        style: TextStyle(
                            fontSize: 35,
                            color: Color(0xFF050901),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'HUB',
                        style: TextStyle(
                          fontSize: 35,
                          color: Color(0xFF4246B7),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Grow As One',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF9B9AAC),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Lorem ipsum dolor sit, amet consectetur adipisicing elit. At, ab. Et, itaque! Dicta ab dignissimos cupiditate. Unde minima recusandae, cumque nisi enim est nostrum laborum saepe iure repellat porro quam. Reprehenderit, dolorum amet soluta dignissimos adipisci, perspiciatis, quo minima veritatis deleniti sequi iusto reiciendis! Obcaecati minus repudiandae doloremque nulla accusamus nesciunt, minima rerum pariatur qui, quidem, porro ad! Deleniti ad, alias accusamus possimus, ea ullam magni perferendis quas consequuntur...',
                    style: TextStyle(
                      color: Color(0xFF433D3D),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Questrial",
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
