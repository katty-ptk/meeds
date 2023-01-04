import 'package:flutter/material.dart';

void openSnackBar(context, snackMessage, color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    action: SnackBarAction(
      label: "OK",
      textColor: Colors.white,
      onPressed: () {},
    ),
    backgroundColor: color,
    content: Text(snackMessage, style: TextStyle(fontSize: 14)),
  ));
}
