import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
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
                    'Contact Us',
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
              Column(
                children: const [
                  RectangleWidget(
                    image: 'images/headphone.png',
                    text: 'Customer service',
                  ),
                  RectangleWidget(
                    image: 'images/whatsapp.png',
                    text: 'Whatsapp',
                  ),
                  RectangleWidget(
                    image: 'images/global.png',
                    text: 'Website',
                  ),
                  RectangleWidget(
                    image: 'images/facebook.png',
                    text: 'Facebook',
                  ),
                  RectangleWidget(
                    image: 'images/twitter.png',
                    text: 'Twitter',
                  ),
                  RectangleWidget(
                    image: 'images/instagram.png',
                    text: 'Instagram',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RectangleWidget extends StatelessWidget {
  final String image;
  final String text;
  final double imageWidth;
  final double imageHeight;

  const RectangleWidget({
    super.key,
    required this.image,
    required this.text,
    this.imageWidth = 24,
    this.imageHeight = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: 349,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFCDCDCD),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            image,
            width: imageWidth,
            height: imageHeight,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xFF433D3D),
                fontFamily: 'Questrial',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
