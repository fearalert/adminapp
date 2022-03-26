import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveladminapp/constants/constants.dart';

class CustomCard extends StatelessWidget {
  final String? text;
  final int? number;
  const CustomCard({
    Key? key,
    required this.text,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, left: 5, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    '$text',
                    style: GoogleFonts.laila(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.25,
                    child: const Divider(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    children: [
                      const Expanded(
                          child: Icon(
                        Icons.graphic_eq,
                        color: kSecondaryColor,
                      )),
                      Expanded(
                        child: Text('$number',
                            style: GoogleFonts.laila(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
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
  }
}
