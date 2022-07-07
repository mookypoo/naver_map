import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:naver_map/views/ios_main.dart';
import 'package:provider/provider.dart';

import '../providers/map_provider.dart';
import 'android_main.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapProvider _mapProvider = Provider.of<MapProvider>(context);

    return Platform.isAndroid
      ? AndroidMain(mapProvider: _mapProvider,)
        : IosMain();
  }
}
