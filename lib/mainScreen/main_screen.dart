import 'package:cab_booking_customer/authetication/login_screen.dart';
import 'package:cab_booking_customer/global/global.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text("LogOut"),
        onPressed: () {
          fAuth.signOut();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => const LoginScreen(),
            ),
          );
        },
      ),
    );
  }
}
