// ignore_for_file: must_be_immutable

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:meeds/provider/sign_in_provider.dart';
import 'package:provider/provider.dart';

class ProfileImageBG extends StatelessWidget {
  String? text;
  bool non_profile;
  ProfileImageBG({super.key, this.text, required this.non_profile});

  @override
  Widget build(BuildContext context) {
    final sp = context.read<SignInProvider>();

    final double coverHeight = 200;
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
              text != null ? Center(child: Text(text.toString(), style: TextStyle(
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
            backgroundImage: NetworkImage(sp.userProfilePic),
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
                !this.non_profile ? 
                Positioned(
                  top: top,
                  child: buildProfileImage()
                ) : Container(),
                Positioned(
                    top: 30,
                    right: 15,
                    child: GestureDetector(
                      onTap: () async {
                        print(sp.userName);
                        await sp.uploadPic(context);
                      },
                      child: Icon(Icons.settings, size: 36, color: Colors.white,)
                    )
                ),
            ]);
  }
}