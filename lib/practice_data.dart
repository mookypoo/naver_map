import 'custom_class/location_class.dart';
import 'custom_class/marker_class.dart';
import 'custom_class/store_class.dart';

class PracticeData {
  static final List<StoreType> myStores = [
    Cafe(
      uid: "1",
      storeName: "리틀빅토리",
      location: LocationClass(latitude: 37.560746, longitude: 126.925701),
    ),
    Cafe(
      uid: "2",
      storeName: "얀 쿠브레",
      location: LocationClass(latitude: 37.559271, longitude: 126.924679),
    ),
    Restaurant(
      uid: "3",
      storeName: "미쁘동",
      location: LocationClass(latitude: 37.562138, longitude: 126.926221),
    ),
    Restaurant(
      uid: "4",
      storeName: "수브니흐",
      location: LocationClass(latitude: 37.561189, longitude: 126.925884),
    ),
  ];

  static List<CustomMarker> myMarkers(){
    List<CustomMarker> _list = [];
    PracticeData.myStores.forEach((StoreType st) => _list.add(CustomMarker.fromMyStores(st)));
    return _list;
  }
}