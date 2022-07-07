import 'package:example/profil.dart';
import 'package:example/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterBootstrap5(
      builder: (ctx) => MaterialApp(
        title: 'Flutter Demo',
        theme: BootstrapTheme.of(ctx).toTheme(
          theme: ThemeData(
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: white,
              elevation: 0.0,
            ),
            fontFamily: GoogleFonts.roboto().fontFamily,
          ),
        ),
        home: const Profile(),
      ),
    );
  }
}
