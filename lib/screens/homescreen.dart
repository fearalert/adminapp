import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveladminapp/components/draweritems.dart';
import 'package:traveladminapp/constants/constants.dart';
import 'package:traveladminapp/screens/notificationscreen.dart';
import 'package:traveladminapp/model/databaseModel.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appbar('Dashboard', Icons.notifications_active),
      drawer: const Drawer(
        child: MenuItems(),
      ),
      backgroundColor: kTextfieldColor,
      body: StreamBuilder<QuerySnapshot>(
          stream: null,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: size.width * 0.45,
                            height: size.height * 0.2,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Total Users',
                                  style: GoogleFonts.laila(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                FutureBuilder<int>(
                                    future: database.getCountUsers(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return Text(
                                          '${snapshot.data}',
                                          style: GoogleFonts.laila(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        );
                                      }

                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: size.width * 0.45,
                            height: size.height * 0.2,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Total Packages',
                                  style: GoogleFonts.laila(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                FutureBuilder<int>(
                                    future: database.getCountPackages(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return Text(
                                          '${snapshot.data}',
                                          style: GoogleFonts.laila(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        );
                                      }
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }),
                              ],
                            )),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: size.width * 0.45,
                            height: size.height * 0.2,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Notifications',
                                  style: GoogleFonts.laila(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                Text(
                                  '20',
                                  style: GoogleFonts.laila(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: size.width * 0.45,
                            height: size.height * 0.2,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Pending Requests',
                                  style: GoogleFonts.laila(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                FutureBuilder<int>(
                                    future: database.getCountbooking(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return Text(
                                          '${snapshot.data}',
                                          style: GoogleFonts.laila(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        );
                                      }
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }),
                              ],
                            )),
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: size.width * 0.45,
                      height: size.height * 0.2,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Accepted Bookings',
                            style: GoogleFonts.laila(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          FutureBuilder<int>(
                              future: database.getCountAcceptedbooking(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return Text(
                                    '${snapshot.data}',
                                    style: GoogleFonts.laila(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  );
                                }
                                return const Center(
                                    child: CircularProgressIndicator());
                              }),
                        ],
                      )),
                ),
              ],
            );
          }),
    );
  }
}

// customizable appbar
appbar(String? text, IconData icon) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    shadowColor: kSecondaryColor,
    elevation: 2.0,
    toolbarHeight: 65.0,
    centerTitle: true,
    title: Text(
      '$text',
      style: GoogleFonts.laila(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
            onPressed: () {
              Get.off(const NotificationScreen());
            },
            icon: Icon(icon)),
      ),
    ],
  );
}

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final double? height;
  final TextEditingController? controller;
  final bool? isNumber;
  const CustomTextField(
      {Key? key, this.hintText, this.height, this.controller, this.isNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autofocus: false,
        controller: controller,
        keyboardType:
            isNumber == true ? TextInputType.phone : TextInputType.text,
        validator: (value) {
          if (isNumber == true) {
            if (value!.isEmpty) {
              return 'Please enter price';
            }
          } else if (value!.isEmpty) {
            return 'Field cannot be empty';
          }
          // return null;
        },
        onSaved: (value) {
          controller!.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          // prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: hintText,
          hintStyle: GoogleFonts.laila(fontSize: 12.0),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
