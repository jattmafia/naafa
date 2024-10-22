import 'package:flutter/material.dart';
import 'package:naafa/features/auth/screens/login.dart';
import 'package:naafa/utils/constants.dart';
import 'package:naafa/widgets/custom_textfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final base = ThemeData.light().textTheme;
    final colorScheme =
        ColorScheme.fromSeed(seedColor: Color(0xff007aff)).copyWith(
      primary: Color(0xff007aff),
    );

    final style = base.copyWith(
      headlineLarge: const TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: archivo,
        fontSize: 30,
      ),
      headlineMedium: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        fontFamily: archivo,
      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        filledButtonTheme: FilledButtonThemeData(
            style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          padding: WidgetStateProperty.all(const EdgeInsets.all(14)),
        )),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: colorScheme,
        textTheme: style,
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
