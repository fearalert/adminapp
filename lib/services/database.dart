import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:traveladminapp/screens/welcomescreen.dart';

DatabaseReference usersReference =
    FirebaseDatabase.instance.reference().child('users');

Stream<QuerySnapshot> _placestream =
    FirebaseFirestore.instance.collection('places').snapshots();

DatabaseReference adminReference =
    FirebaseDatabase.instance.reference().child('admin');

class Database {
  static final Database _instance = Database._internal();
  factory Database() => _instance;
  Database._internal();

  userDataStream(String userId) async {
    return usersReference.child(userId).onValue.map((Event event) {
      List<UserData> userData = [];
      userData.add(UserData.fromData(event.snapshot.value));
      return userData;
    });
  }

  Future<String> getMyToken() async {
    DataSnapshot snapshot =
        await adminReference.child(userAuthentication.userID!).once();

    String token = snapshot.value;
    return token;
  }

  void saveToken(String token) async {
    await adminReference
        .child(userAuthentication.userID!)
        .update({'token': token});
  }

  Future PlacesDataStream() async {
    return _placestream.asBroadcastStream();
  }
}

class UserData {
  String? userName;
  String? id;
  String? userEmail;
  String? userPhoneNo;
  String? profileUrl;

  UserData.fromData(Map userData) {
    userName = userData['name'];
    id = userData['id'];
    userPhoneNo = userData['phoneNo'];
    userEmail = userData['email'];
    profileUrl = userData['profileUrl'];
  }
}
