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
            backgroundImage: NetworkImage("https://scontent.fomr1-1.fna.fbcdn.net/v/t1.6435-9/79871973_1487365728078460_2860243654138658816_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=174925&_nc_ohc=h2JTW9ylC28AX96FtMa&_nc_ht=scontent.fomr1-1.fna&oh=00_AfDXJkxZtKazrADgolwb3OVhHKVsG1VZi0I_z_lYs4gAPQ&oe=63E9B98C"),
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
                    top: 30,
                    right: 15,
                    child: Icon(Icons.settings, size: 36, color: Colors.white,)
                ),
            ]);
  }
}