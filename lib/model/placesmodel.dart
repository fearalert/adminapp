// uploading place details to database
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveladminapp/authentication/adminauthentication.dart';
import 'package:traveladminapp/screens/homescreen.dart';

class PlacesDetails {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  String? placeName;
  String? locationName;
  String? imgUrl;
  String? placeDescription;
  String? startPointName;
  String? endPointName;
  double? price;

  PlacesDetails({
    this.placeName,
    this.locationName,
    this.imgUrl,
    this.placeDescription,
    this.startPointName,
    this.endPointName,
    this.price,
  });

  factory PlacesDetails.fromMap(map) {
    return PlacesDetails(
      placeName: map['placeName'],
      locationName: map['locationName'],
      imgUrl: map['imgUrl'],
      placeDescription: map['placeDescription'],
      startPointName: map['startPointName'],
      endPointName: map['endPointName'],
      price: map['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'placeName': placeName,
      'locationName': locationName,
      'imgUrl': imgUrl,
      'placeDescription': placeDescription,
      'startPointName': startPointName,
      'endPointName': endPointName,
      'price': price,
    };
  }
}

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
PlacesDetails placesDetails = PlacesDetails();

postPlaceDetailsToFirestore() async {
  placesDetails.placeName = uploadPlaceController.placeNameController.text;
  placesDetails.locationName =
      uploadPlaceController.locationNameController.text;
  placesDetails.imgUrl = uploadPlaceController.imgUrlController.text;
  placesDetails.placeDescription =
      uploadPlaceController.placeDescriptionController.text;
  placesDetails.startPointName =
      uploadPlaceController.startPointNameController.text;
  placesDetails.endPointName =
      uploadPlaceController.endPointNameController.text;
  placesDetails.price =
      double.parse(uploadPlaceController.priceController.text);

  return await firebaseFirestore
      .collection('places')
      .doc()
      .set(placesDetails.toMap())
      .then((value) {
    print('data added');
    getSnackBar(
      title: "Congratulations",
      message: 'Uploaded Place Successfully',
      color: Colors.green.shade300,
    );
    Get.offAllNamed(HomeScreen.id);
    uploadPlaceController.placeNameController.text = '';
    uploadPlaceController.locationNameController.text = '';
    uploadPlaceController.imgUrlController.text = '';
    uploadPlaceController.placeDescriptionController.text = '';
    uploadPlaceController.priceController.text = '';
    uploadPlaceController.startPointNameController.text = '';
    uploadPlaceController.endPointNameController.text = '';
  });
}

AdminAuthentication adminAuthentication = AdminAuthentication();
User? admin = adminAuthentication.currentUser;
final UploadPlaceController uploadPlaceController = UploadPlaceController();

class UploadPlaceController extends GetxController {
  final placeNameController = TextEditingController();
  final locationNameController = TextEditingController();
  final imgUrlController = TextEditingController();
  final placeDescriptionController = TextEditingController();
  final startPointNameController = TextEditingController();
  final endPointNameController = TextEditingController();
  final priceController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void dispose() async {
    super.dispose();
    placeNameController.dispose();
    locationNameController.dispose();
    imgUrlController.dispose();
    placeDescriptionController.dispose();
    startPointNameController.dispose();
    endPointNameController.dispose();
    priceController.dispose();
  }
}
