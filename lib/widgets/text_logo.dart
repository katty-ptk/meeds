import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextLogo extends StatefulWidget {
  String title;

  TextLogo({
    super.key,
    required this.title
  });

  @override
  State<TextLogo> createState() => _TextLogoState();
}

class _TextLogoState extends State<TextLogo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.jpg',
          scale: 7.5,
        ),
        Text(
          widget.title, 
          style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  color: Colors.green.shade600
          )
        ),
      ],
    );
  }
}