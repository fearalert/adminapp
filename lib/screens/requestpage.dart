import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveladminapp/components/draweritems.dart';
import 'package:traveladminapp/components/requestdetails.dart';
import 'package:traveladminapp/constants/constants.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        shadowColor: kSecondaryColor,
        elevation: 2.0,
        toolbarHeight: 65.0,
        centerTitle: true,
        title: Text(
          'Requests',
          style: GoogleFonts.laila(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal),
        ),
      ),
      drawer: const Drawer(
        child: MenuItems(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 12.0, left: 12.0, right: 12.0, top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        ClipRect(
                          child: GestureDetector(
                            onTap: () {
                              Get.dialog(const PackageDetails());
                            },
                            child: CircleAvatar(
                              radius: size.width * 0.12,
                              backgroundImage: const NetworkImage(
                                'https://th.bing.com/th/id/R.0e92282c004ac13f55a8f43479c4125d?rik=gI7lf2sePTbhqA&pid=ImgRaw&r=0',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.025,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Package name',
                                  style: GoogleFonts.laila(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.email,
                                    color: kSecondaryColor,
                                    size: 12.0,
                                  ),
                                  Text('email@email.com',
                                      style: GoogleFonts.laila(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      )),
                                ]),
                            Row(
                              children: [
                                RequestCardComponents(
                                  title: 'Details',
                                  icon: Icons.info,
                                  ontap: () {
                                    Get.dialog(
                                      const RequestDetails(),
                                      barrierDismissible: true,
                                      transitionDuration:
                                          const Duration(milliseconds: 300),
                                    );
                                  },
                                ),
                                SizedBox(width: size.width * 0.01),
                                RequestCardComponents(
                                  title: 'Cancel',
                                  icon: Icons.cancel,
                                  ontap: () {},
                                ),
                                SizedBox(width: size.width * 0.01),
                                RequestCardComponents(
                                  title: 'Accept',
                                  icon: Icons.check,
                                  ontap: () {},
                                ),
                                SizedBox(width: size.width * 0.01),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  elevation: 2.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RequestCardComponents extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final VoidCallback? ontap;
  // final Color? colour;
  const RequestCardComponents({
    Key? key,
    this.title,
    this.icon,
    this.ontap,

    // this.colour
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap!,
      child: Container(
        height: 40.0,
        width: 65.0,
        decoration: const BoxDecoration(
            color: kTextfieldColor,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon!,
              size: 12.0,
              color: Colors.black,
            ),
            Text(
              title!,
              style: GoogleFonts.lato(fontSize: 12.0, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
