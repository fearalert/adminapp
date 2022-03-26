import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:traveladminapp/authentication/adminauthentication.dart';
import 'package:traveladminapp/components/custombutton.dart';
import 'package:traveladminapp/components/draweritems.dart';
import 'package:traveladminapp/constants/constants.dart';
import 'package:traveladminapp/model/placesmodel.dart';
import 'package:traveladminapp/screens/homescreen.dart';
import 'package:traveladminapp/services/storage.dart';

class UploadPlaces extends StatefulWidget {
  const UploadPlaces({Key? key}) : super(key: key);

  @override
  State<UploadPlaces> createState() => _UploadPlacesState();
}

class _UploadPlacesState extends State<UploadPlaces> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File? _image;
  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      setState(() {
        if (image != null) {
          _image = File(image.path);
        } else {
          getSnackBar(
              title: 'Unable to pick image',
              color: Colors.blueGrey.shade400,
              message: 'No image Selected');
        }
      });

      // final temp = await saveimage(image.path);

    } on PlatformException catch (error) {
      print(error);
      getSnackBar(
          title: 'Unable to pick image',
          color: Colors.blueGrey.shade400,
          message: 'No image Selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        shadowColor: kSecondaryColor,
        elevation: 2.0,
        toolbarHeight: 65.0,
        centerTitle: true,
        title: Text(
          'Upload places',
          style: GoogleFonts.laila(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal),
        ),
      ),
      drawer: const Drawer(
        child: MenuItems(),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                _image != null
                    ? ClipOval(
                        child: Image.file(
                          _image!,
                          width: 150,
                          height: 150,
                        ),
                      )
                    // : const FlutterLogo(
                    //     size: 150,
                    //   ),
                    : const CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(
                          'https://th.bing.com/th/id/R.0e92282c004ac13f55a8f43479c4125d?rik=gI7lf2sePTbhqA&pid=ImgRaw&r=0',
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Place Details',
                        style: GoogleFonts.laila(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  hintText: 'Place name',
                  controller: uploadPlaceController.placeNameController,
                  isNumber: false,
                ),
                CustomTextField(
                  hintText: 'Location name',
                  controller: uploadPlaceController.locationNameController,
                  isNumber: false,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 16.0, top: 8.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        onPressed: () async {
                          await pickImageFromGallery();
                        },
                        text: 'upload pictures',
                        width: size.width * 0.75,
                        backgroundColor: kSecondaryColor,
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                      const Icon(Icons.upload),
                    ],
                  ),
                ),
                CustomTextField(
                  hintText: ' Description',
                  controller: uploadPlaceController.placeDescriptionController,
                  isNumber: false,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Travel Details',
                        style: GoogleFonts.laila(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  hintText: 'Start Point name',
                  controller: uploadPlaceController.startPointNameController,
                  isNumber: false,
                ),
                CustomTextField(
                  hintText: 'End Point name',
                  controller: uploadPlaceController.endPointNameController,
                  isNumber: false,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                      hintText: 'Price',
                      controller: uploadPlaceController.priceController,
                      isNumber: true,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomButton(
                  onPressed: () async {
                    try {
                      final FormState? form = _formKey.currentState;
                      if (form!.validate()) {
                        form.save();
                      }
                      final storage = Storage();
                      storage.image = _image;
                      storage.uploadImage();
                    } catch (e) {
                      print(e);
                    }
                  },
                  text: 'Upload Data',
                  color: kTextfieldColor,
                  backgroundColor: kPrimaryColor,
                  width: 200.0,
                  fontSize: 20,
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
