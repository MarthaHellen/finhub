import 'package:flutter/material.dart';
import 'package:finhub/pages/contacts.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  ChatsScreenState createState() => ChatsScreenState();
}

class ChatsScreenState extends State<ChatsScreen> {
  int currentIndex = 3;
  static const Color unselectedIconColor = Colors.black;
  static const Color selectedIconColor = Color(0xFF2B5BBA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Container( // Upper part with blue background
                width: double.infinity,
                color: const Color(0xFF2B5BBA),
                padding: const EdgeInsets.only(top: 20.0, left: 10, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      height: 110,
                      child: Padding(
                        padding: EdgeInsets.only(left: 23, top: 52),
                        child: Text(
                          'CHATS',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container( // Lower part with white background
                  color: Colors.white,
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 10.0),
                              Image.asset(
                                'images/avatar@3x.png',
                                width: 64,
                                height: 64,
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'John Doe ',
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Color(0xFF433D3D),
                                            fontFamily: 'Questrial',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          'Today 11:00 am ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF2B5BBA),
                                            fontFamily: 'Questrial',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      'hey, how are you, I was wondering if you if you c....',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF9C9D9E),
                                        fontFamily: 'Questrial',
                                        fontWeight: FontWeight.w400,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Contacts(),
            ),
          );
        },
        backgroundColor: const Color(0xFF2B5BBA),
        child: const Icon(Icons.add),
      ),
    );
  }

}
