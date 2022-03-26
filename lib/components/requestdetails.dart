import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveladminapp/components/custombutton.dart';
import 'package:traveladminapp/constants/constants.dart';

class RequestDetails extends StatelessWidget {
  const RequestDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
          side: BorderSide.none, borderRadius: BorderRadius.circular(20.0)),
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
            decoration: BoxDecoration(
              color: Colors.white,
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
                  backgroundColor: kSecondaryColor,
                  // backgroundImage: userData.profileUrl == null ? AssetImage('images/person.png') : NetworkImage( userData.profileUrl),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Center(
                  child: Text(
                    'Simran Ghimire',
                    style: GoogleFonts.lato(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 100,
                  child: Divider(
                    color: kPrimaryColor,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 26.0, left: 20.0),
                      child: Text(
                        'Contact Details:',
                        style: GoogleFonts.montserrat(
                          fontSize: 18.0,
                          color: kPrimaryColor,
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
                        '9816933888',
                        style: GoogleFonts.roboto(
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
                        color: Colors.orange,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'useremail@gmail.com',
                          style: GoogleFonts.roboto(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                CustomButton(
                    onPressed: () {
                      Get.back();
                    },
                    text: 'OK',
                    color: Colors.white,
                    backgroundColor: const Color(0xff4f5b8a),
                    width: 55.0,
                    fontSize: 12.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PackageDetails extends StatelessWidget {
  const PackageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
          side: BorderSide.none, borderRadius: BorderRadius.circular(20.0)),
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
            decoration: BoxDecoration(
              color: Colors.white,
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
                  backgroundColor: kSecondaryColor,
                  // backgroundImage: userData.profileUrl == null ? AssetImage('images/person.png') : NetworkImage( userData.profileUrl),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Center(
                  child: Text(
                    'PackageName/PlaceName',
                    style: GoogleFonts.lato(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 100,
                  child: Divider(
                    color: kPrimaryColor,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 26.0, left: 20.0),
                          child: Text(
                            'Place Details:',
                            style: GoogleFonts.montserrat(
                              fontSize: 18.0,
                              color: kPrimaryColor,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Icon(
                            Icons.list,
                            color: Colors.blueGrey.shade200,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Place Name',
                            style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 6.0),
                          child: Icon(
                            Icons.location_on,
                            size: 22,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Kaski, Pokhara',
                              style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 26.0, left: 6.0),
                          child: Text(
                            'Travel Details:',
                            style: GoogleFonts.montserrat(
                              fontSize: 18.0,
                              color: kPrimaryColor,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Icon(
                            Icons.start,
                            color: Colors.blueGrey.shade200,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Start Point Name',
                            style: GoogleFonts.roboto(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 6.0),
                      child: Icon(
                        Icons.stop,
                        size: 22,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'End Point Name',
                          style: GoogleFonts.roboto(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 6.0),
                      child: Icon(
                        Icons.price_check,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Price',
                        style: GoogleFonts.roboto(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                CustomButton(
                    onPressed: () {
                      Get.back();
                    },
                    text: 'OK',
                    color: Colors.white,
                    backgroundColor: const Color(0xff4f5b8a),
                    width: 55.0,
                    fontSize: 12.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
