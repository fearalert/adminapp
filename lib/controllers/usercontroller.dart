import 'package:get/get.dart';

class UserController extends GetxController {
  final String userID;
  UserController(this.userID);
  var userData = RxList<UserData>([]);

  List<UserData> get user => userData;

  @override
  Future<void> onInit() async {
    super.onInit();
    // userData.bindStream(Database().userDataStream(userID));
  }
}

class UserData {
  String? userName;
  String? userID;
  String? userEmail;
  int? userPhoneNo;
  String? profileUrl;

  UserData(
      {this.userName,
      this.userID,
      this.userEmail,
      this.userPhoneNo,
      this.profileUrl});

  UserData.fromMap(Map snapshot, String id)
      : userName = snapshot['name'],
        userID = snapshot['id'],
        userEmail = snapshot['email'],
        userPhoneNo = snapshot['phoneNo'],
        profileUrl = snapshot['profileUrl'];
}
