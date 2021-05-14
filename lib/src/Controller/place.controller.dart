import 'package:get/get.dart';

class PlaceController extends GetxService {
  static PlaceController get to => Get.find();

  RxList place = <dynamic>[].obs;
  RxInt placePageNumber = 0.obs;
  RxInt indexCount = 0.obs;
  RxInt pageCounter = 1.obs;

  changePageCounter(int index) {
    pageCounter(index);
  }

  void changeindexCount(int index) {
    indexCount(index);
  }

  placeInit() {
    place(<dynamic>[]);
    placePageNumber(0);
  }

  setPlace(placedata) {
    place.add(placedata);
  }

  setPlacePaceNumber() {
    placePageNumber++;
  }

  setPlaceBookmark(int index, int value) {
    print('bookmark index $index');
    place[index].bookmark = value;
    place.refresh();
  }
}
