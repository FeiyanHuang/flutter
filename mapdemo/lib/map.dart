import 'package:flutter/material.dart';
import 'package:flutter_amap/flutter_amap.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => new _MapState();
}

class _MapState extends State<Map> {
  FlutterAmap amap = new FlutterAmap();

  @override
  void initState() {
    super.initState();
  }

  void show() {
    amap.show(
      mapview: new AMapView(
        centerCoordinate: LatLng(39.9242, 116.3979),
        zoomLevel: 13.0,
        mapType: MapType.night,
        showsUserLocation: true),
      title: TitleOptions(title: "我的地图")
    );
    amap.onLocationUpdated.listen((Location location){
      print("Location change $location");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.bottomRight,
        height: 200.0,
        child: InkWell(child: new Text("Show Map"),onTap: this.show)
      )
    );
  }
}