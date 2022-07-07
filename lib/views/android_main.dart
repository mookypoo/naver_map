import 'dart:async';

import 'package:flutter/material.dart';
import 'package:naver_map/custom_class/marker_class.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart' as naver;

import '../custom_class/location_class.dart';
import '../custom_class/store_class.dart';
import '../providers/map_provider.dart';

class AndroidMain extends StatefulWidget {
  AndroidMain({Key? key, required this.mapProvider}) : super(key: key);
  final MapProvider mapProvider;

  @override
  State<AndroidMain> createState() => _AndroidMainState();
}

class _AndroidMainState extends State<AndroidMain> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!this.mounted) return;
      this.widget.mapProvider.myMarkers.forEach((CustomMarker marker) {
        marker.createImage(context);
        marker.setOnMarkerTab((marker, iconSize) {
          print(marker.captionText);
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: naver.NaverMap(
        initLocationTrackingMode: this.widget.mapProvider.trackingMode,
        initialCameraPosition: naver.CameraPosition(target: this.widget.mapProvider.initLocation),
        locationButtonEnable: true,
        onMapCreated: (naver.NaverMapController ct) async {

        },
        markers: this.widget.mapProvider.myMarkers,
      ),
    );
  }
}


// Completer<naver.NaverMapController> _controller = Completer();
//
// void _onMapCreated(naver.NaverMapController controller) {
//   if (_controller.isCompleted) _controller = Completer();
//   _controller.complete(controller);
// }

