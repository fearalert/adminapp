import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveladminapp/model/placesmodel.dart';

final Stream<QuerySnapshot> requestStream =
    FirebaseFirestore.instance.collection('requestedPackage').snapshots();
CollectionReference packageRef =
    FirebaseFirestore.instance.collection('packages');
CollectionReference requestPackage =
    FirebaseFirestore.instance.collection('requestedPackage');
CollectionReference acceptedRef =
    FirebaseFirestore.instance.collection('acceptedPackage');

final placeRef = FirebaseFirestore.instance
    .collection('places')
    .withConverter<PlacesDetails>(
      fromFirestore: (snapshot, _) => PlacesDetails.fromMap(snapshot.data()!),
      toFirestore: (placedetail, _) => placedetail.toMap(),
    );

class Database {
  Future<int> getCountUsers() async {
    int count = await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) => value.size);
    return count;
  }

  // Future<int> getCountbooking() async {
  //   int count = await FirebaseFirestore.instance
  //       .collection('requestedPackage')
  //       .where('status', isEqualTo: 'pending')
  //       .get()
  //       .then((value) => value.size);
  //   return count;
  // }

  Future<int> getCountAcceptedbooking() async {
    int count = await FirebaseFirestore.instance
        .collection('requestedPackage')
        // .where('status', isEqualTo: 'pending')
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
        .delete()
        .then((value) => print('Deleted'));
  }

  Future<void> deletePackage(String packageId) {
    return packageRef.doc(packageId).delete().then((value) => print('Deleted'));
  }

  Future<void> acceptPackage(String documentId, Map data) async {
    await requestPackage
        .doc(documentId)
        .update({'status': 'accepted'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
    await acceptedRef
        // existing document in 'users' collection: "ABC123"
        .doc(documentId)
        .set(data);

    await acceptedRef.doc(documentId).update({'status': 'accepted'});
  }
}

Database database = Database();
