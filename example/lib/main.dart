import 'package:example/cubits/app_cubit.dart';
import 'package:example/cubits/app_state.dart';
import 'package:example/profil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppCubit appCubit;

  @override
  void initState() {
    appCubit = AppCubit();
    super.initState();
  }

  @override
  void dispose() {
    appCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>.value(
      value: appCubit,
      child: BlocBuilder<AppCubit, AppState>(
        bloc: appCubit,
        builder: (context, state) {
          return FlutterBootstrap5(
            fontSize: state.defaultFontSize,
            builder: (ctx) => MaterialApp(
              title: 'Flutter Bootstrap5 Demo',
              theme: BootstrapTheme.of(ctx).toTheme(
                theme: ThemeData(
                  scaffoldBackgroundColor: BootstrapTheme.of(ctx).colors.white,
                  appBarTheme: AppBarTheme(
                    backgroundColor: BootstrapTheme.of(ctx).colors.primary,
                    foregroundColor: BootstrapTheme.of(ctx).colors.white,
                    elevation: 0.0,
                  ),
                  fontFamily: GoogleFonts.roboto().fontFamily,
                ),
              ),
              home: const Profile(),
            ),
          );
        },
      ),
    );
  }
}
