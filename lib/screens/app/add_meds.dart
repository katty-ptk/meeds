import 'package:flutter/material.dart';

class AddMedsScreen extends StatefulWidget {
  const AddMedsScreen({super.key});

  @override
  State<AddMedsScreen> createState() => _AddMedsScreenState();
}

class _AddMedsScreenState extends State<AddMedsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Add Meds Page", style: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold
    )));
  }
}