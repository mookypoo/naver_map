import 'package:flutter/cupertino.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart' show Marker, OverlayImage;

import 'location_class.dart';
import 'store_class.dart';

class CustomMarker extends Marker {
  final String assetName;
  // CustomMarker({
  //   required String markerId,
  //   required LocationClass position,
  //   required this.assetName,
  //   required String text,
  //   //required OverlayImage icon,
  // }) : super(markerId: markerId, position: position, width: 30, height: 55, captionText: text);

  /// for SDK 2.16 and up
  CustomMarker({
    required this.assetName,
    required super.markerId,
    required super.position,
    required super.captionText,
    super.width = 30,
    super.height = 45,
    //required super.onMarkerTab
  });

  factory CustomMarker.fromMyStores(StoreType store) => CustomMarker(
      markerId: store.uid,
      position: store.location,
      assetName: store.image,
      captionText: store.storeName,
      //onMarkerTab: callBack,
  );

  Future<void> createImage(BuildContext context) async {
    this.icon = await OverlayImage.fromAssetImage(assetName: this.assetName, context: context);
  }

  void setOnMarkerTab(void Function(Marker marker, Map<String, int> iconSize) callBack){
    this.onMarkerTab = callBack;
  }
}