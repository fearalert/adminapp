import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveladminapp/components/custombutton.dart';
import 'package:traveladminapp/constants/constants.dart';
import 'package:traveladminapp/screens/login.dart';
import 'package:traveladminapp/screens/registration.dart';

class GetStarted extends StatelessWidget {
  static const id = '/getstarted';
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: Center(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: size.width * 0.9,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: size.height * 0.08),
                      Center(
                        child: Text(
                          "    Welcome to\n Tours & Travels",
                          style: GoogleFonts.laila(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.0825),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomButton(
                                onPressed: () => Get.toNamed(Registration.id),
                                text: 'Register as Admin',
                                color: Colors.white,
                                backgroundColor: kPrimaryColor,
                                width: 200.0,
                                fontSize: 20,
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Text(
                                'Already registered?',
                                style: GoogleFonts.laila(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(LogInScreen.id);
                                },
                                child: Text(
                                  'LogIn as admin',
                                  style: GoogleFonts.laila(
                                    fontSize: 14.0,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
