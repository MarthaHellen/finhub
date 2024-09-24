import 'package:flutter/material.dart';
import 'package:finhub/components/account_row.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String selectedValue = 'Plan name 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9EEF9),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'images/Logo-big.png',
                            height: 31,
                          ),
                          const SizedBox(width: 5.0),
                          const Text(
                            "Account",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF433D3D),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        tileColor: Colors.white,
                        leading: const CircleAvatar(
                          backgroundImage:
                              AssetImage('images/avatar@3x.png'),
                          radius: 25.0,
                        ),
                        title: const Text(
                          'Josephine',
                          style: TextStyle(
                            color: Color(0xFF433D3D),
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        subtitle: const Text(
                          'josephine66@gmail.com',
                          style: TextStyle(
                            color: Color(0xFF9C9D9E),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        trailing: Image.asset("images/edit.png"),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        color: Color(0xFFEDEDED),
                        thickness: 1.0,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AccountRow(
                          imagePath: "images/edit.png",
                          containerColor: const Color(0xFF2B5BBA),
                          text: "Profile Info",
                          navigationRoute: "/profile_info"),
                      const SizedBox(
                        height: 30,
                      ),
                      AccountRow(
                          imagePath: "images/key.png",
                          containerColor: const Color(0xFF02AF71),
                          text: "Password Reset",
                          navigationRoute: "/password_reset"),
                      const SizedBox(
                        height: 30,
                      ),
                      AccountRow(
                          imagePath: "images/infocircle.png",
                          containerColor: const Color(0xFFF43A3A),
                          text: "FAQs & Inquiries",
                          navigationRoute: "/faqs_inquiries"),
                      const SizedBox(
                        height: 30,
                      ),
                      AccountRow(
                          imagePath: "images/book.png",
                          containerColor: const Color(0xFFC0C0C0),
                          text: "Verification Details",
                          navigationRoute: "/verification_details"),
                      const SizedBox(
                        height: 30,
                      ),
                      AccountRow(
                          imagePath: "images/call-1.png",
                          containerColor: const Color(0xFFF0BC01),
                          text: "Contact Us",
                          navigationRoute: "/contact_us"),
                      const SizedBox(
                        height: 30,
                      ),
                      AccountRow(
                          imagePath: "images/dropbox.png",
                          containerColor: const Color(0xFF9801DF),
                          text: "About",
                          navigationRoute: "/about_us"),
                      const SizedBox(
                        height: 30,
                      ),
                      AccountRow(
                          imagePath: "images/share.png",
                          containerColor: const Color(0xFF11DBE8),
                          text: "Share",
                          navigationRoute: "/share"),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
