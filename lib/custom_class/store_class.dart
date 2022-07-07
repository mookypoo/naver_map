import 'package:flutter/material.dart';

import 'location_class.dart';

abstract class StoreType {
  final String uid = "";
  final String storeName = "";
  final Color color = const Color.fromRGBO(162, 25, 255, 1.0);
  final String image = "";
  final LocationClass location = LocationClass(longitude: 0.0, latitude: 0.0);
}

class Restaurant implements StoreType {
  @override
  final String uid;

  @override
  final Color color = const Color.fromRGBO(162, 25, 255, 1.0);

  @override
  final String image = "assets/markers/restaurant.png";

  @override
  final String storeName;

  @override
  final LocationClass location;

  Restaurant({required this.uid, required this.storeName, required this.location});
}

class Cafe implements StoreType {
  @override
  final String uid;

  @override
  final Color color = const Color.fromRGBO(255, 106, 0, 1.0);

  @override
  final String image = "assets/markers/cafe.png";

  @override
  final String storeName;

  @override
  final LocationClass location;

  Cafe({required this.uid, required this.storeName, required this.location});
}

