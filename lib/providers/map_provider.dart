import 'package:flutter/foundation.dart';
import 'package:naver_map/service/location_service.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart' show LocationTrackingMode;

import '../custom_class/location_class.dart';
import '../custom_class/marker_class.dart';
import '../practice_data.dart';

class MapProvider with ChangeNotifier {
  final LocationService _locationService = LocationService();
  final LocationClass initLocation = LocationService.initLocation;

  final List<CustomMarker> myMarkers = PracticeData.myMarkers();

  MapProvider(){
    Future(this.setCurrentLocation);
  }


  LocationTrackingMode _trackingMode = LocationTrackingMode.None;
  LocationTrackingMode get trackingMode => this._trackingMode;
  set trackingMode(LocationTrackingMode m) => throw "error";

  Future<void> setCurrentLocation() async {
    if (await this._locationService.canGetCurrentLocation()){
      this._trackingMode = LocationTrackingMode.Follow;
      this.notifyListeners();
    }
  }

}