import 'package:flutter/material.dart';
import 'package:finhub/pages/home_screen_page.dart';
import 'package:finhub/pages/savings_details.dart';
import 'package:finhub/pages/loans_screen.dart';
import 'package:finhub/pages/account_screen.dart';
import 'package:finhub/pages/chats_screen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
  final int? selectedIndex; 

  const BottomNavigation({Key? key, this.selectedIndex}) : super(key: key);
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreenPage(),
    const SavingsDetails(),
    const LoansScreen(),
    const ChatsScreen(),
    const AccountScreen(),
  ];

  static const List<String> _menuTitles = <String>[
    'Home',
    'Savings',
    'Loans',
    'Chats',
    'Account',
  ];

  static const List<String> _menuIcons = <String>[
    'images/home_icon.png',
    'images/savings_icon.png',
    'images/loans_icon.png',
    'images/chats_icon.png',
    'images/account_icon.png',
  ];

  static const List<String> _activeMenuIcons = <String>[
    'images/home.png', // Active icon for 'Home' menu item
    'images/savings_icon.png',
    'images/loans_icon.png',
    'images/chats_icon.png',
    'images/account_icon.png',
  ];

  // Define the TextStyle for the menu labels
  static const TextStyle _menuLabelStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Questrial',
  );

  @override
  void initState() {
    super.initState();
    if (widget.selectedIndex != null) {
      _selectedIndex = widget.selectedIndex!;
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          for (var i = 0; i < _menuTitles.length; i++)
            BottomNavigationBarItem(
              icon: Image.asset(
                _selectedIndex == i ? _activeMenuIcons[i] : _menuIcons[i],
                height: 24,
                width: 24,
                color: _selectedIndex == i
                    ? const Color(0xFF2B5BBA)
                    : Colors.black,
              ),
              label: _menuTitles[i],
            ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF2B5BBA),
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        unselectedLabelStyle:
            _menuLabelStyle, // Apply the TextStyle to unselected labels
        selectedLabelStyle:
            _menuLabelStyle, // Apply the TextStyle to selected labels
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
