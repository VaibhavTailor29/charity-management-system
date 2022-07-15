import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/google_signin_provider.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/pages/loginscreen.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/pages/donate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_catalog/pages/loginscreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(
      // home: Homepage(),

      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        // primaryTextTheme: GoogleFonts.latoTextTheme()
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),

      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        // "/": (context) => StreamBuilder<User?>(
        //       stream: FirebaseAuth.instance.authStateChanges(),
        //       builder: (context, snapshot) {
        //         if (snapshot.hasData) {
        //           return HomePage();
        //         } else {
        //           return LoginPage();
        //         }
        //       },
        //     ),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.donate: (context) => donate()
      },
    )
    );
}
