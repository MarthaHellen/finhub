import 'package:flutter/material.dart';

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 230,
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/card1.jpg',
                  height: 100,
                  fit: BoxFit.cover,
                  width: 230,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '#Investment',
                      style: TextStyle(
                        color: Color(0xFF2B5BBA),
                        fontSize: 14,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '2hr ago',
                      style: TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 14,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    //
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Lorem ipsum dolor sit amet consectetur...',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: 'Read more',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF4246B7),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  children: const [
                    CircleAvatar(
                            backgroundImage: AssetImage('images/card2.jpg'),
                            radius: 20.0,
                          ),
                    SizedBox(width: 8.0),
                    Text(
                      "Invest Ug",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF433D3D),
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 230,
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/card1.jpg',
                  height: 100,
                  fit: BoxFit.cover,
                  width: 230,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '#Investment',
                      style: TextStyle(
                        color: Color(0xFF2B5BBA),
                        fontSize: 14,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '2hr ago',
                      style: TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 14,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    //
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Lorem ipsum dolor sit amet consectetur...',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: 'Read more',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF4246B7),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  children: const [
                    CircleAvatar(
                            backgroundImage: AssetImage('images/card2.jpg'),
                            radius: 20.0,
                          ),
                    SizedBox(width: 8.0),
                    Text(
                      "Invest Ug",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF433D3D),
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 230,
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/card1.jpg',
                  height: 100,
                  width: 230,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '#Investment',
                      style: TextStyle(
                        color: Color(0xFF2B5BBA),
                        fontSize: 14,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '2hr ago',
                      style: TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 14,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    //
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Lorem ipsum dolor sit amet consectetur...',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: 'Read more',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF4246B7),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  children: const [
                    CircleAvatar(
                            backgroundImage: AssetImage('images/card2.jpg'),
                            radius: 20.0,
                          ),
                    SizedBox(width: 8.0),
                    Text(
                      "Invest Ug",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF433D3D),
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
