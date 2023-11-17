import 'package:flutter/material.dart';

// ignore: prefer_typing_uninitialized_variables
showsackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(text)));
}
