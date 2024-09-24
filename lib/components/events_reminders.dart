import 'package:flutter/material.dart';

class EventsReminders extends StatefulWidget {
  const EventsReminders({super.key});

  @override
  State<EventsReminders> createState() => _EventsRemindersState();
}

class _EventsRemindersState extends State<EventsReminders> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            leading: const Icon(
              Icons.account_balance_wallet,
              color: Color(0xFF2B5BBA),
            ),
            title: const Text(
              'Save more',
              style: TextStyle(
                color: Color(0xFF2B5BBA),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            subtitle: const Text(
              'You haven\'t saved in a month now',
              style: TextStyle(
                color: Color(0xFF9C9D9E),
                fontSize: 12,
                fontFamily: 'Questrial',
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Transform.scale(
              scale: 0.6,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF2B5BBA).withOpacity(0.20),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    // Your onPressed action goes here
                  },
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            leading: const Icon(
              Icons.videocam,
              color: Color(0xFF2B5BBA),
            ),
            title: const Text(
              'Learn more on savings',
              style: TextStyle(
                color: Color(0xFF2B5BBA),
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            subtitle: const Text(
              'Learn more on savings in the upcoming webinar',
              style: TextStyle(
                color: Color(0xFF9C9D9E),
                fontFamily: 'Questrial',
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            trailing: Transform.scale(
              scale: 0.6,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF2B5BBA).withOpacity(0.20),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    // Your onPressed action goes here
                  },
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            leading: const Icon(
              Icons.account_balance_wallet,
              color: Color(0xFF2B5BBA),
            ),
            title: const Text(
              'Reminder',
              style: TextStyle(
                color: Color(0xFF2B5BBA),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            subtitle: const Text(
              'Your next loan payment is due 2nd Aug',
              style: TextStyle(
                color: Color(0xFF9C9D9E),
                fontFamily: 'Questrial',
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            trailing: Transform.scale(
              scale: 0.6,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF2B5BBA).withOpacity(0.20),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    // Your onPressed action goes here
                  },
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
