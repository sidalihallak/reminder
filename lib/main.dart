import 'package:flutter/material.dart';
import 'package:reminder/screens/add_list/add_list_screen.dart';
import 'package:reminder/screens/add_reminder/add_reminder_screen.dart';
import 'package:reminder/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/addList': (context) => AddListScreen(),
        '/addReminder': (context) => AddReminderScreen(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(color: Colors.black),
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Colors.white),
        accentColor: Colors.white,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              primary: Colors.blueAccent,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )
          )
        ),
        dividerColor: Colors.grey[600],
      ),
    );
  }
}
