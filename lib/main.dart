import 'package:flutter/material.dart';
import 'package:vitamins_app/constants.dart';
import 'package:vitamins_app/screens/Welcome/welcome_screen.dart';
// import 'package:vitamins_app/screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vitamins Shop',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        // textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: TextButton.styleFrom(
        //     padding: EdgeInsets.all(defaultPadding * 0.75),
        //     shape: StadiumBorder(),
        //     backgroundColor: primaryColor,
        //   ),
        // ),
      ),
      home: WelcomeScreen(),
      // home: HomeScreen(),
    );
  }
}