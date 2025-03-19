import 'package:flutter/material.dart';

class TextWithTextbutton extends StatelessWidget {
  const TextWithTextbutton(
      {super.key,
      required this.text,
      required this.buttonText,
      required this.onPressedButton});
  final String text;
  final String buttonText;
  final VoidCallback onPressedButton;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text),
        SizedBox(width: 20),
        InkWell(
          onTap: onPressedButton,
          child: Text(buttonText),
        )
      ],
    );
  }
}
