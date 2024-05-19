import 'package:flutter/material.dart';
import 'package:my_health_app/src/feature/screens/age_screen.dart';
import 'package:my_health_app/src/feature/screens/bmi_screen.dart';
import 'package:my_health_app/src/routes/my_health_approuter.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MyHealthApprouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
