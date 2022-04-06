import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:traveladminapp/constants/constants.dart';
import 'package:traveladminapp/screens/totalplaces.dart';

class CommentsPage extends StatefulWidget {
  final String? packageId;
  const CommentsPage({
    Key? key,
    required this.packageId,
  }) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
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
          'Reviews',
          style: GoogleFonts.laila(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.off(const TotalPlaces());
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('packages')
              .doc(widget.packageId)
              .collection('ratingReviews')
              .snapshots(),
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

                  return Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                    child: Container(
                      width: double.infinity,
                      //     // height: 55.0,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          border: Border(
                              left: BorderSide(
                                color: Colors.grey,
                              ),
                              right: BorderSide(
                                color: Colors.grey,
                              ),
                              bottom: BorderSide(
                                color: Colors.grey,
                              ),
                              top: BorderSide(
                                color: Colors.grey,
                              ))),
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: kSecondaryColor,
                          child: Center(
                            child: Text('P'),
                          ),
                        ),
                        selectedColor: kSecondaryColor,
                        selectedTileColor: kSecondaryColor,
                        title: Text('Id: ' + data['userId'],
                            style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Text(
                                'Rating: ' +
                                    data['rating'].toString() +
                                    ' / 5.0',
                                style: GoogleFonts.laila(color: Colors.black)),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Text(
                              'Review: ' + data['review'],
                              style: GoogleFonts.laila(color: Colors.black),
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                          ],
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        enableFeedback: true,
                        isThreeLine: true,
                        textColor: Colors.black,
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
