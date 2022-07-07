import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart' show Position;
import 'package:naver_map/service/location_service.dart';

class MapProvider with ChangeNotifier {
  final LocationService _locationService = LocationService();

  Future<Position?>? initLocation() async => await this._locationService.initLocation();

}