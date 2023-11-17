import 'package:bankvisual/resources/auth_method.dart';
import 'package:bankvisual/screen/home.dart';
import 'package:bankvisual/screen/login_screen.dart';
import 'package:bankvisual/screen/video_call_screen.dart';
import 'package:bankvisual/utiles/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: backgroundColor, useMaterial3: true),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
          '/video-call': (context) => VideoCallScreen()
        },
        home: StreamBuilder(
          stream: AuthMethods().authChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return const HomeScreen();
            }
            return const LoginScreen();
          },
        ));
  }
}
