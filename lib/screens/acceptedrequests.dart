import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveladminapp/components/draweritems.dart';
import 'package:traveladminapp/components/requestdetails.dart';
import 'package:traveladminapp/constants/constants.dart';
import 'package:traveladminapp/model/chat.dart';
import 'package:traveladminapp/screens/chatscreen.dart';
import 'package:traveladminapp/screens/welcomescreen.dart';

class AcceptedRequestPage extends StatefulWidget {
  const AcceptedRequestPage({Key? key}) : super(key: key);

  @override
  State<AcceptedRequestPage> createState() => _AcceptedRequestPageState();
}

class _AcceptedRequestPageState extends State<AcceptedRequestPage> {
  final Stream<QuerySnapshot> acceptedPackage = FirebaseFirestore.instance
      .collection('acceptedPackage')
      .where('status', isEqualTo: 'accepted')
      .snapshots();
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
          'Accepted Bookings',
          style: GoogleFonts.laila(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal),
        ),
      ),
      drawer: const Drawer(
        child: MenuItems(),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: acceptedPackage,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading"));
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;

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
                            Get.dialog(PackageDetails(
                              packageDetail: data,
                            ));
                          },
                          child: CircleAvatar(
                            radius: size.width * 0.12,
                            backgroundImage: NetworkImage(
                              data['packageImg'],
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
                                data['packageName'],
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
                                Text(data['userEmail'],
                                    style: GoogleFonts.laila(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    )),
                              ]),
                          Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.date_range,
                                  color: kSecondaryColor,
                                  size: 12.0,
                                ),
                                Text(
                                    DateFormat('yyyy-MM-dd')
                                        .format(DateTime.parse(
                                            data['date'].toDate().toString()))
                                        .toString(),
                                    style: GoogleFonts.laila(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    )),
                              ]),
                          SizedBox(
                            width: size.width * 0.025,
                          ),
                          Row(
                            children: [
                              RequestCardComponents(
                                title: 'Details',
                                icon: Icons.info,
                                ontap: () {
                                  Get.dialog(
                                    RequestDetails(
                                      requestDetail: data,
                                    ),
                                    barrierDismissible: true,
                                    transitionDuration:
                                        const Duration(milliseconds: 300),
                                  );
                                },
                              ),
                              SizedBox(width: size.width * 0.01),
                              RequestCardComponents(
                                title: 'Chat',
                                icon: Icons.chat,
                                ontap: () {
                                  Get.off(ChatScreen(
                                      adminId: userAuthentication.userID));
                                },
                              ),
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
            }).toList(),
          );
        },
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
