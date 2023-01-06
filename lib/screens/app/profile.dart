import 'dart:ui';
import 'package:flutter/material.dart';
import '../../provider/sign_in_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
    final double coverHeight = 300;
    final double avatarHeight = 144;

  @override
  Widget build(BuildContext context) {
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
          imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.grey.withOpacity(1),
            child: Image.network("https://wallpapercave.com/wp/wp4041548.jpg", width: double.infinity, fit: BoxFit.cover),
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
            backgroundImage: NetworkImage("https://newprofilepic2.photo-cdn.net//assets/images/article/profile.jpg"),
          ),
          SizedBox(height: 10,),
          Text(
            "Katty",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat"
            ),
          )
        ],
      );
    }

    return Scaffold(
      body: Stack(
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
      ]),
    );
  
  
  }

}