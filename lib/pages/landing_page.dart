import 'package:flutter/material.dart';
import './signup_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color green = Colors.green.shade600;
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
                          color: green,
                          fontStyle: FontStyle.italic
                      )
                    ),
                    const TextSpan(text: '!',)
                  ],
                ),
              ),
              Image.asset(
                'assets/images/logo.jpg',
                scale: 10,
              ),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpPage()));
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: black
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
                onPressed: (){}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: black,
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat-Bold'
                  ),
                )
              ),
            ],
          ),
          Text(
            'Want to learn more?',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: green,
              fontFamily: 'Montserrat-Bold',
              letterSpacing: 0.7
            ),
          )
        ],
      )
    );
  }
}
