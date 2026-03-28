import "package:cms/screens/ProfileNavScreen.dart";
import "package:cms/themes/theme.dart";
import "package:cms/themes/themeprovider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Themeprovider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // color: Color.fromARGB(255, 252, 252, 252),
      theme: Provider.of<Themeprovider>(context).themeData,

      home: HomeScreen(),
    );
  }
}
