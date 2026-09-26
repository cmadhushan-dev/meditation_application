import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditation_application/providers/filter_provider.dart';
import 'package:meditation_application/providers/meditation_provider.dart';
import 'package:meditation_application/providers/mindful_excerices_provider.dart';
import 'package:meditation_application/providers/sleep_exceces_provider.dart';
import 'package:meditation_application/router/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers:[
      ChangeNotifierProvider(create: (context)=>MindfulExcericesProvider()),
      ChangeNotifierProvider(create: (context)=>MeditationProvider()),
      ChangeNotifierProvider(create: (context)=>SleepExcecesProvider()),
      ChangeNotifierProvider(create: (context)=>FilterProvider()),
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().router,
    );
  }
}
