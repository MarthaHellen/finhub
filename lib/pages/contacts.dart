import 'package:finhub/pages/messages_screen.dart';
import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                    'Contacts',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF050901),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      'Already on FinHub',
                      style: TextStyle(
                        color: Color(0xff2B5BBA),
                        fontSize: 25,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView(
                  children: [
                    for (int i = 0; i < 5; i++)
                      GestureDetector(
                        onTap: () {
                          // Navigate to another page when the item is clicked
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MessagesScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Image.asset(
                                'images/avatar@3x.png',
                                width: 45,
                                height: 45,
                              ),
                              const SizedBox(width: 20.0),
                              const Text(
                                'John Doe',
                                style: TextStyle(
                                  color: Color(0xff433D3D),
                                  fontSize: 22,
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      'Invite on FinHub',
                      style: TextStyle(
                        color: Color(0xFF2B5BBA),
                        fontSize: 25,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to another page when the item is clicked
                        _showInviteDialog(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'images/avatar@3x.png',
                              width: 45,
                              height: 45,
                            ),
                            const SizedBox(width: 20.0),
                            const Text(
                              'John Doe',
                              style: TextStyle(
                                color: Color(0xFF433D3D),
                                fontSize: 22,
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showInviteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(20),
          titlePadding: const EdgeInsets.all(20),
          insetPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          content: SizedBox(
            width: 322,
            height: 222,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Send an Invite Link',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff2B5BBA),
                    fontFamily: 'Questrial',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'http://dhjdef/finhub/josephine?deGjQ334',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff828282),
                    fontFamily: 'Questrial',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 130,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          //
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2B5BBA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Send',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 130,
                      height: 40,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDDE2EB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF828282),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
