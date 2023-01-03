import 'package:flutter/material.dart';
import 'package:futuristiccashmanager/router.dart';

void main() {
  runApp(const FuturisticCashManager());
}

class FuturisticCashManager extends StatelessWidget {
  const FuturisticCashManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF185b5b),
          cardColor: const Color(0XFF448c8a),
          dividerColor: const Color(0XFF8aa9ab),
          colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Color(0xFF185b5b),
            onPrimary: Colors.white,
            secondary: Color(0XFFeeb49b),
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.white,
            background: Color(0xFF185b5b),
            onBackground: Colors.white,
            surface: Color(0XFF448c8a),
            onSurface: Colors.white,
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: const Color(0xFF155350),
            filled: true,
            isDense: true,
            border: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.transparent,
                style: BorderStyle.none,
                width: 0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.transparent,
                style: BorderStyle.none,
                width: 0,
              ),
            ),
            contentPadding: EdgeInsets.zero,
          ),
          appBarTheme:
              const AppBarTheme(elevation: 0, color: Colors.transparent)),
    );
  }
}
