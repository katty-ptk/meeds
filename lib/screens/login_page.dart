import 'package:flutter/material.dart';
import 'package:meeds/screens/signup_page.dart';
import 'package:provider/provider.dart';
import '../provider/sign_in_provider.dart';
import '../widgets/text_logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email_text = "";
  String password_text = "";

  @override
  Widget build(BuildContext context) {
    final keyboard_open = MediaQuery.of(context).viewInsets.bottom == 0;  // check if keyboard is open or not

    handleLogin() {
      final sp = context.read<SignInProvider>();
      
      if ( email_text != "" && password_text != "" ) {
        print(email_text + " and " + password_text);
        sp.loginUser(email_text, password_text, context);
      } else {
        print("no change:/");
      }
    }

    return Scaffold(
                  body: Stack(children: <Widget>[
                    Container(
                      color:  Colors.white,
                    ),
                    Positioned(
                      top: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: AppBar(
                        title: Text(''),// You can add title here
                        leading: new IconButton(
                          icon: new Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        backgroundColor: Colors.transparent, //You can make this transparent
                        elevation: 0.0, //No shadow
                      ),),
                      
    
      
                      ListView(
                        padding: EdgeInsets.only(top: 150),
                        children: [
                          SafeArea(child: Center(child: TextLogo(title: 'Login'))),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: double.infinity,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 80),
                                        child: Text('email:'),
                                      ),
                                      TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            email_text = value.characters.toString();
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'ex: example@domain.com',
                                          enabledBorder: UnderlineInputBorder(      
                                            borderSide: BorderSide(color: Colors.black),   
                                          ),  
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black, width: 2),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30,),
                          
                                // password
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('password:'),
                                      TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            password_text = value.characters.toString();
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText: '********',
                                          enabledBorder: UnderlineInputBorder(      
                                            borderSide: BorderSide(color: Colors.black),   
                                          ),  
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black, width: 2),
                                          ),
                                        ),
                                        obscureText: true,
                                      )
                                    ],
                                  ),
                                ),
                          
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: double.infinity, height: 30,),
                          
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 30,),
                                        Text('Don\'t have an account yet?',  style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Montserrat-Bold'
                                        )),
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpPage()));
                                          },
                                          child: Text(' Sign Up', style: TextStyle(
                                            color: Colors.green[600],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat',
                                          ),),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                           ]
                      ),
      
                     if(keyboard_open) Expanded(  // if leyboard is open, then "next step" button is not shown because it takes up too much space
                        child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: GestureDetector(
                          onTap: (){
                            handleLogin();
                          },
                          child: Container(
                            // color: Colors.black,
                            width: double.infinity,
                            height: 65,
                            decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                            child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.green[600], size: 30,),
                          ),
                        ),
                        ),
                      ) 
                  ]),
      );
   }
}