import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:traveladminapp/authentication/adminauthentication.dart';
import 'package:traveladminapp/constants/constants.dart';
import 'package:traveladminapp/screens/getstarted.dart';
import 'package:traveladminapp/screens/homescreen.dart';

final userAuthentication = AdminAuthentication();

class WelcomeScreen extends StatelessWidget {
  static const String id = '/welcome';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      backgroundColor: const Color(0xffffffff),
      navigateRoute: userAuthentication.currentUser != null
          ? const HomeScreen()
          : const GetStarted(),
      // navigateRoute: const GetStarted(),
      duration: 3000,
      text: 'Tours & Travels',
      textStyle: GoogleFonts.arizonia(
        color: kPrimaryColor,
        fontSize: 50.0,
        fontWeight: FontWeight.bold,
      ),

      pageRouteTransition: PageRouteTransition.SlideTransition,
    );
  }
}
