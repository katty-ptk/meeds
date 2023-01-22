// ignore_for_file: must_be_immutable

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:meeds/services/sign_in.service.dart';
import 'package:provider/provider.dart';

class ProfileImageBG extends StatefulWidget {
  String? text;
  bool non_profile;
  ProfileImageBG({super.key, this.text, required this.non_profile});

  @override
  State<ProfileImageBG> createState() => _ProfileImageBGState();
}

class _ProfileImageBGState extends State<ProfileImageBG> {
  @override
  Widget build(BuildContext context) {
    final sp = context.read<SignInProvider>();

    String profile_pic = sp.userProfilePic;

    final double coverHeight = 250;
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
                    child: Image.network("https://images.unsplash.com/photo-1557100955-93b2fb57c317?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80", width: double.infinity, fit: BoxFit.cover),
                  ),
                ),
              ),
              widget.text != null ? Center(child: Text(widget.text.toString(), style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade300
              ),)) : Text("")
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
            backgroundImage: NetworkImage(profile_pic),
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
                !this.widget.non_profile ? 
                Positioned(
                  top: top,
                  child: buildProfileImage()
                ) : Container(),
                Positioned(
                    top: 30,
                    right: 15,
                    child: GestureDetector(
                      onTap: () async {
                        print(sp.userName);setState(() async {                          
                          profile_pic = await sp.uploadPic(context);
                          print(profile_pic);
                        });
                      },
                      child: Icon(Icons.settings, size: 36, color: Colors.white,)
                    )
                ),
            ]);
  }
}