import 'package:flutter/material.dart';
import 'package:meeds/screens/start/login_page.dart';
import 'package:meeds/utils/meeds_colors.dart';
import 'package:meeds/utils/next_screen.dart';
import './signup_page.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color black = Colors.black87;
    
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity,),
          Column(
            children: [
              Image.asset(
                'assets/images/logo.jpg',
                scale: 10,
              ),
              RichText(
                text: TextSpan(
                  text: 'Welcome to ',
                  style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'meeds', 
                    style: TextStyle(
                      color: MyColors.dark_purple,
                      fontStyle: FontStyle.italic
                    )
                  ),
                  const TextSpan(text: '!',)
                ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Column(
                children: [
                  ElevatedButton(
                    onPressed: (){
                      nextScreen(context, SignUpPage());
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: black,
                      minimumSize: const Size(100, 30),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat-Bold'
                      ),
                    )
                  ),
                  ElevatedButton(
                    onPressed: (){
                      nextScreen(context, LoginPage());
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: black,
                      minimumSize: const Size(100, 30),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat-Bold'
                      ),
                    )
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('- or -',),
                  ),
                  GestureDetector(
                    onTap: (){  },
                    child: Image.asset(
                      'assets/images/google.png', 
                      height: 32,
                    )
                  )
                ],
              ),
            ],
          ),
          Text(
            'Want to learn more?',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: MyColors.light_pink,
              fontFamily: 'Montserrat-Bold',
              letterSpacing: 0.7
            ),
          )
        ],
      )
    );
  }
}
