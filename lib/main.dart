import 'package:flutter/material.dart';
import 'package:egaz/onboarding_screen.dart';
import 'package:egaz/pages/colors.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        title: 'Egaz Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen(),
      ),
      create: (context) => AppStyleModeNotifier(),
    );
  }
}
