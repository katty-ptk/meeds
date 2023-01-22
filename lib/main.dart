import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:meeds/services/firestore.service.dart';
import 'package:meeds/services/sign_in.service.dart';
import 'package:meeds/screens/start/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meeds/widgets/restart.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  
  runApp(RestartWidget(
        child:  MyApp()
      ),);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignInProvider()),
        ChangeNotifierProvider(create: (context) => FirestoreService()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Montserrat-Bold'),
        home: SplashScreen()
      ),
    );
  }
}

