import 'package:bankvisual/utiles/colors.dart';
import 'package:flutter/material.dart';

class MeetingOption extends StatelessWidget {
  final String text;
  final bool ismute;
  final Function(bool) onChange;

  MeetingOption(
      {super.key,
      required this.text,
      required this.ismute,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: buttonColor,
      child: SizedBox(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Switch(value: ismute, onChanged: onChange)
          ],
        ),
      ),
    );
  }
}
