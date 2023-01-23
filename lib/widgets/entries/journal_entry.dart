// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:meeds/utils/meeds_colors.dart';

class JournalEntry extends StatefulWidget {
  JournalEntry({super.key, required this.data, required this.date, required this.type});

  String data = "";
  String date = "";
  String type = "";

  @override
  State<JournalEntry> createState() => _JournalEntryState();
}

class _JournalEntryState extends State<JournalEntry> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      width: double.infinity,
      // color: MyColors.light_pink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${this.widget.date}",
                style: TextStyle(
                  fontSize: 12
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                // color: Colors.red,
                decoration: BoxDecoration(
                  color: MyColors.dark_purple,
                  borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: Text(
                  "${this.widget.type}",
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 5,),
          Text(
            "${this.widget.data}",
            style: TextStyle(
              fontSize: 20
            ),
          ),
          Divider(
            height: 30,
            thickness: 3,
            color: MyColors.light_pink
          ),
          SizedBox(height: 20,)
        ]
      ),
    );
  }
}