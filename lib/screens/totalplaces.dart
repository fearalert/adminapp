import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveladminapp/components/draweritems.dart';
import 'package:traveladminapp/components/requestdetails.dart';
import 'package:traveladminapp/constants/constants.dart';

final Stream<QuerySnapshot> _placestream =
    FirebaseFirestore.instance.collection('places').snapshots();

class TotalPlaces extends StatefulWidget {
  const TotalPlaces({Key? key}) : super(key: key);

  @override
  State<TotalPlaces> createState() => _TotalPlacesState();
}

class _TotalPlacesState extends State<TotalPlaces> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kTextfieldColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        shadowColor: kSecondaryColor,
        elevation: 2.0,
        toolbarHeight: 65.0,
        centerTitle: true,
        title: Text(
          'Total places',
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
          stream: _placestream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return Column(
                children: [
                  Center(
                    child: Text(
                      'No data',
                      style: GoogleFonts.laila(
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              print(snapshot.data);

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return SizedBox(
                    height: 130.0,
                    child: Card(
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
                                  backgroundImage: NetworkImage(
                                    data['imgUrl'],
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
                                      data['placeName'],
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
                                        Icons.place_sharp,
                                        color: kSecondaryColor,
                                        size: 12.0,
                                      ),
                                      Text(data['locationName'],
                                          style: GoogleFonts.laila(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          )),
                                    ]),
                                Row(
                                  children: [
                                    PlacesComponents(
                                      count: '100',
                                      icon: Icons.place,
                                      ontap: () {},
                                    ),
                                    SizedBox(width: size.width * 0.01),
                                    PlacesComponents(
                                      count: '15',
                                      icon: Icons.comment,
                                      ontap: () {},
                                    ),
                                    SizedBox(width: size.width * 0.01),
                                    PlacesComponents(
                                      count: 'Edit',
                                      icon: Icons.edit,
                                      ontap: () {},
                                    ),
                                    SizedBox(width: size.width * 0.01),
                                    PlacesComponents(
                                      count: 'Delete',
                                      icon: Icons.delete,
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
                      elevation: 2.0,
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          }),
    );
  }
}

// ignore: must_be_immutable
class PlacesComponents extends StatelessWidget {
  late String? count;
  final IconData? icon;
  final VoidCallback? ontap;
  PlacesComponents({
    Key? key,
    this.count,
    this.icon,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap!,
      child: Container(
        height: 40.0,
        width: 55.0,
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
              '$count',
              style: GoogleFonts.lato(fontSize: 12.0, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}

// class PlacesStream extends StatelessWidget {
//   const PlacesStream({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

//       },
//     );
//   }
// }
