// uploading place details to database
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveladminapp/authentication/adminauthentication.dart';
import 'package:traveladminapp/screens/homescreen.dart';
import 'package:traveladminapp/screens/welcomescreen.dart';
import 'package:uuid/uuid.dart';

class PlacesDetails {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  String? packageName;
  String? locationName;
  String? imgUrl;
  String? placeDescription;
  String? startPointName;
  String? endPointName;
  String? packageId;
  double? price;
  double? avgRating;
  String? adminID;

  PlacesDetails(
      {this.packageName,
      this.locationName,
      this.imgUrl,
      this.placeDescription,
      this.startPointName,
      this.endPointName,
      this.price,
      this.packageId,
      this.avgRating,
      this.adminID});

  factory PlacesDetails.fromMap(map) {
    return PlacesDetails(
        packageName: map['placeName'],
        locationName: map['locationName'],
        imgUrl: map['imgUrl'],
        placeDescription: map['placeDescription'],
        startPointName: map['startPointName'],
        endPointName: map['endPointName'],
        price: map['price'],
        packageId: map['packageId'],
        avgRating: map['avgRating'],
        adminID: map['adminID']);
  }

  Map<String, dynamic> toMap() {
    return {
      'packageName': packageName,
      'locationName': locationName,
      'imgUrl': imgUrl,
      'placeDescription': placeDescription,
      'startPointName': startPointName,
      'endPointName': endPointName,
      'price': price,
      'packageId': packageId,
      'avgRating': avgRating,
      'adminID': adminID
    };
  }
}

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
PlacesDetails placesDetails = PlacesDetails();

postPlaceDetailsToFirestore() async {
  const uuid = Uuid();
  String uid = uuid.v4();
  placesDetails.packageName = uploadPlaceController.placeNameController.text;
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
  placesDetails.packageId = uid;
  placesDetails.avgRating = 0.0;
  placesDetails.adminID = userAuthentication.userID;

  return await FirebaseFirestore.instance
      .collection('packages')
      .doc(uid)
      .set(placesDetails.toMap(), SetOptions(merge: true))
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

User? admin = userAuthentication.currentUser;
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
