import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:traveladminapp/model/placesmodel.dart';

class Storage {
  File? image;
  String? imageUrl;
  final instance = FirebaseStorage.instance;
  Reference ref = FirebaseStorage.instance
      .ref('places')
      .child('${placesDetails.locationName}')
      .child('${placesDetails.packageName}')
      .child('${placesDetails.packageName}.jpg');

  Future uploadImage() async {
    try {
      ListResult? listResult;
      String? fileName;
      try {
        listResult = await ref.listAll();
        if (listResult.items.isNotEmpty) {
          fileName = listResult.items[0].name;
          deleteFile(fileName);
        }
        await ref.putFile(image!);
        // imageUrl = await imgUrl(fileName);
      } on PlatformException catch (error) {
        print(error);
      }
      // String dateTime = DateTime.now()
      //     .toString()
      //     .replaceAll('.', '')
      //     .replaceAll(':', '')
      //     .replaceAll('-', '')
      //     .replaceAll(' ', '');

      imageUrl = await imgUrl(fileName);
      print(imageUrl);
      uploadPlaceController.imgUrlController.text = imageUrl!;
      postPlaceDetailsToFirestore();
      // return true;
    } catch (e) {
      print(e);
      // return false;
    }
  }

  deleteFile(String fileName) {
    try {
      instance
          .ref(
              'places/${placesDetails.locationName}/${placesDetails.packageName}')
          .child('${placesDetails.packageName}.jpg')
          .delete();
    } catch (e) {
      print(e);
      return 'error';
    }
  }

  Future<String> imgUrl(String? name) async {
    try {
      return await instance
          .ref(
              'places/${placesDetails.locationName}/${placesDetails.packageName}')
          .child('${placesDetails.packageName}.jpg')
          .getDownloadURL();
    } catch (e) {
      print(e);
      return 'error';
    }
  }
}
