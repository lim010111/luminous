import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TsHomeScreen extends StatelessWidget {
  const TsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text("My Home"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.home),
            label: "Home",
          ),
        ],
      ),
    );
  }
}
