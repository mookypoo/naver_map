import 'package:flutter/material.dart';
import 'package:naver_map/providers/map_provider.dart';
import 'package:naver_map/views/main_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(NaverMap());

class NaverMap extends StatelessWidget {
  const NaverMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MapProvider>(create: (_) => MapProvider())
      ],
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}

