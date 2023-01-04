import 'package:flutter/material.dart';
import 'package:meeds/provider/sign_in_provider.dart';
import 'package:meeds/screens/login_page.dart';
import 'package:meeds/widgets/text_logo.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email_text = "";
  String password_text = "";

  @override
  Widget build(BuildContext context) {
    final keyboard_open = MediaQuery.of(context).viewInsets.bottom == 0;  // check if keyboard is open or not

    handleSignUp() {
      final sp = context.read<SignInProvider>();
      
      if ( email_text != "" && password_text != "" ) {
        print(email_text + " and " + password_text);
        sp.signUpUser(email_text, password_text, context);
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
                          SafeArea(child: Center(child: TextLogo(title: 'Sign Up'))),
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
                                      SizedBox(height: 30,),
                                      TextFormField(
                                        onChanged: (text) {
                                          setState(() {
                                            email_text = text.characters.toString();
                                          });
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'email',
                                          enabledBorder: UnderlineInputBorder(      
                                            borderSide: BorderSide(color: Colors.black),   
                                          ),  
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black, width: 2),
                                          ),
                                        ),
                                      ),
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
                                      TextFormField(
                                       onChanged: ( text ) {
                                        setState(() {
                                          password_text = text.characters.toString();
                                        });
                                       },
                                       decoration: InputDecoration(
                                          labelText: 'password',
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
                                        Text('Already have an account?',  style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Montserrat-Bold'
                                        )),
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
                                          },
                                          child: Text(' Login', style: TextStyle(
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
                            handleSignUp();
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