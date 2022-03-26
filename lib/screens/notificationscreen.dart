import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveladminapp/components/custombutton.dart';
import 'package:traveladminapp/components/draweritems.dart';
import 'package:traveladminapp/constants/constants.dart';
import 'package:traveladminapp/screens/homescreen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

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
            'Notifications',
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
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            elevation: 10.0,
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10.0),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          'Send Notification',
                                          style: GoogleFonts.laila(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Divider(
                                          color: kPrimaryColor,
                                        ),
                                        const SizedBox(height: 10.0),
                                        const CustomTextField(
                                          hintText: 'Title',
                                        ),
                                        const CustomTextField(
                                          hintText: 'Description',
                                        ),
                                        const SizedBox(height: 20.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            CustomButton(
                                              onPressed: () {},
                                              text: 'cancel',
                                              color: Colors.white,
                                              backgroundColor:
                                                  Colors.red.shade400,
                                              width: 160.0,
                                              fontSize: 20,
                                            ),
                                            CustomButton(
                                              onPressed: () {},
                                              text: 'Send',
                                              color: Colors.white,
                                              backgroundColor: kPrimaryColor,
                                              width: 160.0,
                                              fontSize: 20,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      text: 'Send notifications',
                      color: kPrimaryColor,
                      backgroundColor: kTextfieldColor,
                      width: 260.0,
                      fontSize: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    width: double.infinity,
                    // height: 55.0,
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
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Title of Notifications",
                                style: GoogleFonts.roboto(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {}, child: const Icon(Icons.delete))
                            ],
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            "Hi there, We have been testing our notification services. This is a notification service page.Hi there, We have been testing our notification services. This is a notification service page.",
                            style: GoogleFonts.roboto(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
