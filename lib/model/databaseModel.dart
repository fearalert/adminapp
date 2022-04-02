

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:traveladminapp/components/requestdetails.dart';
import 'package:traveladminapp/model/placesmodel.dart';

final Stream<QuerySnapshot> requestStream = FirebaseFirestore.instance.collection('requestedPackage').snapshots();
CollectionReference packageRef = FirebaseFirestore.instance.collection('packages');
CollectionReference requestPackage = FirebaseFirestore.instance.collection('requestedPackage');


final placeRef = FirebaseFirestore.instance.collection('places').withConverter<PlacesDetails>(
      fromFirestore: (snapshot, _) => PlacesDetails.fromMap(snapshot.data()!),
      toFirestore: (placedetail, _) => placedetail.toMap(),
    );

class Database{

    Future<int> getCountUsers() async {
    int count = await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) => value.size);
    return count;
  }

     Future<int> getCountbooking() async {
    int count = await FirebaseFirestore.instance
        .collection('requestedPackage')
        .get()
        .then((value) => value.size);
    return count;
  }


       Future<int> getCountPackages() async {
    int count = await FirebaseFirestore.instance
        .collection('packages')
        .get()
        .then((value) => value.size);
    return count;
  }

  //    Future<int> getCountNotifications() async {
  //   int count = await FirebaseFirestore.instance
  //       .collection('notifications')
  //       .get()
  //       .then((value) => value.size);
  //   return count;
  // }


    Future<void> deleteBookings(String requestId) {
  return requestPackage
    .doc(requestId)
    .delete().then((value) => print('Deleted'));
    
}

Future<void> deletePackage(String packageId) {
  return packageRef
    .doc(packageId)
    .delete().then((value) => print('Deleted'));
    
}

Future<void> acceptPackage(String documentId) async{
  await requestPackage
    .doc(documentId)
    .update({'status': 'accepted'})
    .then((value) => print("User Updated"))
    .catchError((error) => print("Failed to update user: $error"));


}


   } 


Database database = Database();

