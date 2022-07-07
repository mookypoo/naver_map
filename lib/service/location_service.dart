import 'package:geolocator/geolocator.dart';

class LocationClass {
  final double latitude;
  final double longitude;

  LocationClass({required this.latitude, required this.longitude});
}

class LocationService {
  final LocationClass _hongdae = LocationClass(latitude: 37.558514, longitude: 126.925544);

  Future<LocationPermission> hasLocationPermission() async => await Geolocator.checkPermission();

  Future<bool> isLocationEnabled() async => await Geolocator.isLocationServiceEnabled();

  Future<LocationPermission> requestLocation() async => await Geolocator.requestPermission();

  Future<Position> currentLocation() async => await Geolocator.getCurrentPosition();

  Future<LocationClass> initLocation() async {
    final LocationPermission _permission = await this.hasLocationPermission();
    if (_permission == LocationPermission.always || _permission == LocationPermission.whileInUse) {
      final bool _enabled = await this.isLocationEnabled();
      if (_enabled) {
        final Position _currentLocation = await this.currentLocation();
        return LocationClass(latitude: _currentLocation.latitude, longitude: _currentLocation.longitude);
      }
    }
    return this._hongdae;
  }
}