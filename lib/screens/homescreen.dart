import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:traveladminapp/components/customcard.dart';
import 'package:traveladminapp/components/draweritems.dart';
import 'package:traveladminapp/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    final List<String> texts = [
      'Total Users',
      'Total Places',
      ' Notifications',
      'Total Requests',
      // 'Featured',
    ];
    final List<int> count = [
      1521, 20, 12, 11,
      // 10
    ];
    return Scaffold(
      appBar: appbar('Dashboard', Icons.notifications_active),
      drawer: const Drawer(
        child: MenuItems(),
      ),
      backgroundColor: kTextfieldColor,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 8.0),
                child: StaggeredGridView.countBuilder(
                    itemCount: 4,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                    itemBuilder: (context, index) {
                      return CustomCard(
                        text: texts[index],
                        number: count[index],
                      );
                    },
                    staggeredTileBuilder: (index) {
                      return StaggeredTile.count(1, index.isOdd ? 1.0 : 1.0);
                    }),
              ),
            ),
          ],
        ),
      ),
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
        child: IconButton(onPressed: () {}, icon: Icon(icon)),
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
          return null;
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
