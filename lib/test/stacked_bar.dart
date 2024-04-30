import 'package:flutter/material.dart';

class StackedBar extends StatefulWidget {
  const StackedBar({super.key});

  @override
  State<StackedBar> createState() => _StackedBarState();
}

class _StackedBarState extends State<StackedBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Row(
            children: [
              Expanded(
                flex: (0.1 * 1000).toInt(),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 18,
                        color: const Color.fromARGB(255, 209, 50, 38),
                      ),
                      const Text(
                        "asdasd",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: (0.3 * 1000).toInt(),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 18,
                      color: const Color.fromARGB(255, 51, 147, 54),
                    ),
                    const Text(
                      "asdasd",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: (0.6 * 1000).toInt(),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 18,
                        color: const Color.fromARGB(255, 0, 2, 140),
                      ),
                      const Text(
                        "asdasd",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
