import 'dart:async';

import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart' as naver;

import '../providers/map_provider.dart';

class AndroidMain extends StatelessWidget {
  AndroidMain({Key? key, required this.mapProvider}) : super(key: key);
  final MapProvider mapProvider;

  Completer<naver.NaverMapController> _controller = Completer();

  void _onMapCreated(naver.NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          naver.NaverMap(
            initialCameraPosition: this.mapProvider.initLocation() != null
              ? naver.CameraPosition(target: naver.LatLng(this.mapProvider.initLocation()., longitude)),
            locationButtonEnable: true, /// 현 위치 보여주기
            onMapCreated: (naver.NaverMapController ct) {

            },

          ),
        ]
      ),
    );
  }
}
