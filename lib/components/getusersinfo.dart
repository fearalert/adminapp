import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveladminapp/constants/constants.dart';
import 'package:traveladminapp/controllers/usercontroller.dart';

class GetUsersInfo extends StatelessWidget {
  final String userID;
  const GetUsersInfo({
    Key? key,
    required this.userID,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetX<UserController>(
        init: UserController(
          userID,
        ),
        builder: (userController) {
          if (userController.user.isEmpty) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(
                  color: kPrimaryColor,
                  backgroundColor: Colors.white,
                ),
              ],
            );
          }
          UserData userData = userController.user[0];
          return Dialog(
            shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(20.0)),
            elevation: 10.0,
            backgroundColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: size.width,
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    bottom: 20.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  // margin:
                  //     EdgeInsets.only(top: 80),
                  decoration: BoxDecoration(
                    color: const Color(0xff141a1e),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white38,
                        offset: Offset(0, 2),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      const CircleAvatar(
                        radius: 55.0,
                        backgroundColor: Colors.teal,
                        // backgroundImage: userData.profileUrl == null
                        //     ? const AssetImage('images/person.png')
                        //     : NetworkImage(userData.profileUrl),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Center(
                        child: Text(
                          userData.userName!.toUpperCase(),
                          style: GoogleFonts.montserrat(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                        child: Divider(
                          color: Colors.blueGrey,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 26.0, left: 20.0),
                            child: Text(
                              userData.userEmail!,
                              style: GoogleFonts.montserrat(
                                fontSize: 18.0,
                                color: Colors.greenAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Icon(
                              Icons.phone,
                              color: Colors.teal,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              '${userData.userPhoneNo}',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  letterSpacing: 1.3,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Icon(
                              Icons.email,
                              size: 22,
                              color: Colors.yellow,
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                userData.userEmail!,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20.0,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xff4f5b8a),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xff2f3650),
                                offset: Offset(0, 1),
                                blurRadius: 4.0,
                              ),
                            ],
                          ),
                          child: const Text(
                            'Ok',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
