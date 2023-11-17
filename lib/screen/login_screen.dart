import 'package:bankvisual/resources/auth_method.dart';
import 'package:bankvisual/widgets/custom_Button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authServices = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Convene a meeting",
            style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 187, 142, 51),
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
            child: Image.asset('assets/on.jpg'),
          ),
          CustomButton(
            text: 'Google Sign In',
            onPressed: () async {
              bool res = await _authServices.signInWithGoogle(context);
              if (res) {
                Navigator.pushNamed(context, '/home');
              }
            },
          ),
        ],
      ),
    );
  }
}
