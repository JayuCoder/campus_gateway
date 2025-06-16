import 'package:campus_gateway/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Gateway',
      theme: _isDarkMode
          ? ThemeData.dark().copyWith(
              textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
              appBarTheme: AppBarTheme(
                titleTextStyle: GoogleFonts.lato(
                  textStyle: ThemeData.dark().appBarTheme.titleTextStyle,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: const IconThemeData(color: Colors.white),
              ),
            )
          : ThemeData(
              primarySwatch: Colors.blue,
              textTheme: GoogleFonts.latoTextTheme(
                ThemeData.light().textTheme.copyWith(
                      displayLarge: TextStyle(color: Colors.black),
                      displayMedium: TextStyle(color: Colors.black),
                      displaySmall: TextStyle(color: Colors.black),
                      headlineLarge: TextStyle(color: Colors.black),
                      headlineMedium: TextStyle(color: Colors.black),
                      headlineSmall: TextStyle(color: Colors.black),
                      titleLarge: TextStyle(color: Colors.black),
                      titleMedium: TextStyle(color: Colors.black),
                      titleSmall: TextStyle(color: Colors.black),
                      bodyLarge: TextStyle(color: Colors.black),
                      bodyMedium: TextStyle(color: Colors.black),
                      bodySmall: TextStyle(color: Colors.black),
                      labelLarge: TextStyle(color: Colors.black),
                      labelMedium: TextStyle(color: Colors.black),
                      labelSmall: TextStyle(color: Colors.black),
                    ),
              ),
              appBarTheme: AppBarTheme(
                titleTextStyle: GoogleFonts.lato(
                  textStyle: ThemeData.light().appBarTheme.titleTextStyle,
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: const IconThemeData(color: Colors.black),
              ),
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
      home: LoginScreen(toggleTheme: _toggleTheme),
    );
  }
}
