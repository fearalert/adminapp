import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveladminapp/constants/constants.dart';
import 'package:traveladminapp/controllers/registrationcontroller.dart';
import 'package:traveladminapp/screens/getstarted.dart';
import 'package:traveladminapp/screens/homescreen.dart';
import 'package:traveladminapp/screens/login.dart';
import 'package:traveladminapp/screens/registration.dart';
import 'package:traveladminapp/screens/welcomescreen.dart';

final RegistrationController registrationController = RegistrationController();
bool? isAdminRegistered;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: WelcomeScreen.id,
      title: 'Tours and travels',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        cardColor: Colors.white,
        canvasColor: kPrimaryColor,
        textSelectionTheme: const TextSelectionThemeData(
            selectionColor: kPrimaryColor, cursorColor: kPrimaryColor),
      ),
      defaultTransition: Transition.fade,
      // home: Registration(),
      getPages: [
        GetPage(name: WelcomeScreen.id, page: () => const WelcomeScreen()),
        GetPage(name: HomeScreen.id, page: () => const HomeScreen()),
        GetPage(name: GetStarted.id, page: () => const GetStarted()),
        GetPage(
            curve: Curves.easeIn,
            transition: Transition.upToDown,
            name: LogInScreen.id,
            page: () => LogInScreen()),
        GetPage(
            curve: Curves.easeIn,
            transition: Transition.downToUp,
            name: Registration.id,
            page: () => Registration()),
      ],
    );
  }
}
