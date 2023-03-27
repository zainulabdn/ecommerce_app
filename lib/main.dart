import 'package:e_commerce_app/appColors/app_colors.dart';
import 'package:e_commerce_app/screens/homepage/home_page.dart';
import 'package:e_commerce_app/screens/loginScreen/login_screen.dart';
import 'package:e_commerce_app/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'mybottombar/my_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(),
        iconTheme: const IconThemeData(
          color: AppColors.baseDarkPinkColor,
        ),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),

      routes: const {

      },

    );
  }
}

