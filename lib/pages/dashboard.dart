import 'package:flutter/material.dart';
import 'package:finhub/firebase_auth/auth.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text('Dashboard'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: ElevatedButton(
                    onPressed: () async{
                        await Auth().signOut(context);
                    },
                    child: const Text('Sign Out'),
                  ),
            ),
          ),
        );
  }
}
