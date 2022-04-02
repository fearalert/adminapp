import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveladminapp/constants/constants.dart';
import 'package:traveladminapp/screens/acceptedrequests.dart';
import 'package:traveladminapp/screens/homescreen.dart';
import 'package:traveladminapp/screens/login.dart';
import 'package:traveladminapp/screens/notificationscreen.dart';
import 'package:traveladminapp/screens/requestpage.dart';
import 'package:traveladminapp/screens/totalplaces.dart';
import 'package:traveladminapp/screens/uploadplaces.dart';
import 'package:traveladminapp/screens/users.dart';
import 'package:traveladminapp/screens/welcomescreen.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    'Menu ',
                    style: GoogleFonts.laila(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  MenuComponents(
                    text: 'Dashboard',
                    icon: Icons.dashboard_customize,
                    ontap: () {
                      Get.off(const HomeScreen());
                    },
                  ),
                  MenuComponents(
                    text: 'Booking Requests',
                    icon: Icons.request_page,
                    ontap: () {
                      Get.off(const RequestPage());
                    },
                  ),
                  MenuComponents(
                    text: 'Accepted Bookings',
                    icon: Icons.request_quote,
                    ontap: () {
                      Get.off(const AcceptedRequestPage());
                    },
                  ),
                  MenuComponents(
                    text: 'Places',
                    icon: Icons.place,
                    ontap: () {
                      Get.off(const TotalPlaces());
                    },
                  ),
                  MenuComponents(
                    text: 'Upload Places',
                    icon: Icons.upload,
                    ontap: () {
                      Get.off(const UploadPlaces());
                    },
                  ),
                  MenuComponents(
                    text: 'Notifications',
                    icon: Icons.notifications,
                    ontap: () {
                      Get.off(const NotificationScreen());
                    },
                  ),
                  MenuComponents(
                    text: 'Users',
                    icon: Icons.person,
                    ontap: () {
                      Get.off(const Users());
                    },
                  ),
                  MenuComponents(
                    text: 'Payment',
                    icon: Icons.payments,
                    ontap: () {},
                  ),
                  MenuComponents(
                    text: 'Sign Out',
                    icon: Icons.logout,
                    ontap: () {
                      userAuthentication.logOut();
                      Get.dialog(
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(
                              color: kPrimaryColor,
                              backgroundColor: Colors.white,
                            ),
                          ],
                        ),
                      );
                      Get.toNamed(LogInScreen.id);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuComponents extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final VoidCallback? ontap;
  const MenuComponents({
    Key? key,
    required this.text,
    required this.icon,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap!,
      child: Container(
        width: double.infinity,
        height: 70.0,
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: kTextfieldColor)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon!),
                const SizedBox(
                  width: 50.0,
                ),
                Text(
                  text!,
                  style: GoogleFonts.roboto(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
