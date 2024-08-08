import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apktest/providers/user_provider.dart';
import 'package:apktest/providers/palindrome_provider.dart';
import 'package:apktest/screens/first_screen.dart';
import 'package:apktest/screens/second_screen.dart';
import 'package:apktest/screens/third_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => PalindromeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => FirstScreen(),
          '/second': (context) => SecondScreen(),
          '/third': (context) => ThirdScreen(),
        },
      ),
    );
  }
}
