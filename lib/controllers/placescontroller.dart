import 'package:get/get.dart';
import 'package:traveladminapp/model/placesmodel.dart';

class PlaceController extends GetxController {
  final String placeName;
  PlaceController(this.placeName);
  var placeDetails = RxList<PlacesDetails>([]);

  List<PlacesDetails> get place => placeDetails;

  @override
  Future<void> onInit() async {
    super.onInit();
    // placeDetails.bindStream(Database().PlacesDataStream());
  }
}
