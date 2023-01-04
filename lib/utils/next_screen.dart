import 'package:flutter/material.dart';

void nextScreen(context, page) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context)=>page)
  );
}

void nextScreenReplace(context, page) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context)=>page)
  );
}