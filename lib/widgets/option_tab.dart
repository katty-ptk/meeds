import 'package:flutter/material.dart';

import '../utils/meeds_colors.dart';
import '../utils/next_screen.dart';

class OptionTab extends StatelessWidget {
  String text;
  Widget page;
  OptionTab({super.key, required this.text, required this.page});

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () {
          nextScreen(context, page);
        },
        child: Stack(
          children: [
            Text(text, style: TextStyle(
              fontSize: 18,
            ),),
            Positioned(right: 10, child: Icon(Icons.navigate_next_outlined)),
            Divider(thickness: 2, height: 60, color: MyColors.light_pink,)
          ],
        ),
      );
  }
}