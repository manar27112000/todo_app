import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/app_routes.dart';
import 'package:todo_app/core/theme/app_theme.dart';
import 'package:todo_app/ui/auth/login/login_screen.dart';
import 'package:todo_app/ui/home/home_screen.dart';

import 'firebase_options.dart';
import 'ui/auth/register/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    onGenerateRoute: (settings){
      switch(settings.name){
        case AppRoutes.home_route:
          return MaterialPageRoute(builder: (context)=>HomeScreen());
        case AppRoutes.register_route:
          return MaterialPageRoute(builder: (context)=>RegisterScreen());
        case AppRoutes.login_route:
        return MaterialPageRoute(builder: (context)=>LoginScreen());
      }
    },
      initialRoute: AppRoutes.login_route,
    );
  }
}
