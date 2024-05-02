import 'package:flutter/material.dart';
import 'package:luminous/home/light_status_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onAllDevicesTap() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LightStatusScreen(),
        ),
      );
    }

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.07,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 40,
              ),
              child: Text(
                "My Home",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            GestureDetector(
              onTap: onAllDevicesTap,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.86,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffA226DD),
                      Color(0xff6740D6),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: MediaQuery.of(context).size.width * 0.8 * 0.2,
                      top: 60,
                      child: const Text(
                        'All Devices',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
