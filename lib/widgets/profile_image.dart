import 'dart:ui';

import 'package:flutter/material.dart';

class ProfileImageBG extends StatelessWidget {
  const ProfileImageBG({super.key});

  @override
  Widget build(BuildContext context) {
    final double coverHeight = 300;
    final double avatarHeight = 144;
    final top = coverHeight - avatarHeight / 2;

    Widget buildCoverImage() {
      return Container(
        child: SizedBox(
          height: coverHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect( // Clip it cleanly. 
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.grey.withOpacity(1),
                    child: Image.network("https://images.unsplash.com/photo-1528183429752-a97d0bf99b5a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80", width: double.infinity, fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        )
      );
    }

    Widget buildProfileImage(){
      return Column(
        children: [
          CircleAvatar(
            radius: avatarHeight / 2,
            backgroundImage: NetworkImage("https://scontent.fomr1-1.fna.fbcdn.net/v/t1.6435-9/108016846_1675963819218649_6868067377403521169_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=174925&_nc_ohc=Lzid33mSv4wAX9sOsQA&_nc_ht=scontent.fomr1-1.fna&oh=00_AfDf0KbwTq5Balw4G7pj1Wq4XPmQYpSeV7SsaQAiwCRHDA&oe=63E91A7D"),
          ),
          SizedBox(height: 10,),
        ],
      );
    }

    return Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                buildCoverImage(),
                Positioned(
                  top: top,
                  child: buildProfileImage()
                ),
                Positioned(
                    top: 60,
                    right: 15,
                    child: Icon(Icons.settings, size: 36, color: Colors.white,)
                ),
            ]);
  }
}