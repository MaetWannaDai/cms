import "package:cms/Homescreen.dart";
import "package:flutter/material.dart";

void main() {
  runApp(const MyCMS());
}

class MyCMS extends StatefulWidget {
  const MyCMS({super.key});

  @override
  State<MyCMS> createState() => _MyCMSState();
}

class _MyCMSState extends State<MyCMS> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color.fromARGB(255, 252, 252, 252),

      home: HomeScreen(),
    );
  }
}
