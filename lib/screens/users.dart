import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveladminapp/components/draweritems.dart';
import 'package:traveladminapp/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final Stream<QuerySnapshot> _usersstream =
    FirebaseFirestore.instance.collection('users').snapshots();

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
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
          'Users',
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
          stream: _usersstream,
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
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  print(document.data());

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
                          backgroundImage: NetworkImage(
                            'https://th.bing.com/th/id/R.0e92282c004ac13f55a8f43479c4125d?rik=gI7lf2sePTbhqA&pid=ImgRaw&r=0',
                          ),
                        ),
                        selectedColor: kSecondaryColor,
                        selectedTileColor: kSecondaryColor,
                        title: Text(data['name'],
                            style: GoogleFonts.roboto(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            )),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Text(
                              data['email'],
                              style: GoogleFonts.laila(),
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Text(data['phoneNo'], style: GoogleFonts.laila()),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Text('ID:' + data['id'],
                                style: GoogleFonts.laila()),
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
                        trailing: GestureDetector(
                            onTap: () => CopySelectionTextIntent.copy,
                            child: const Icon(Icons.content_copy)),
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
