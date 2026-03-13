import "package:cms/Homescreen.dart";
import "package:cms/themes/theme.dart";
import "package:cms/themes/themeprovider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Themeprovider(),
      child: const MyCMS(),
    ),
  );
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
      // color: Color.fromARGB(255, 252, 252, 252),
      theme: Provider.of<Themeprovider>(context).themeData,

      home: HomeScreen(),
    );
  }
}
