import 'package:archive/screens/archive/components/map_view.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArchiveScreen extends StatefulWidget {
  const ArchiveScreen({Key? key}) : super(key: key);

  @override
  _ArchiveScreenState createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  WebViewController? _mapController;
  double _lat = 33.450701;
  double _lng = 126.570667;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addMarker,
        child: Icon(Icons.add),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            MapView(
              lat: _lat,
              lng: _lng,
              initMapController: _initMapController,
              onCameraIdle: _onCameraIdle,
              onTapMarker: _onTapMarker,
            ),
          ],
        ),
      ),
    );
  }

  void _initMapController(WebViewController controller) {
    _mapController = controller;
  }

  void _onCameraIdle(double lat, double lng) {
    _lat = lat;
    _lng = lng;
  }

  void _addMarker() async {
    try {
      await _mapController?.runJavascript('''
        addMarker(new kakao.maps.LatLng($_lat + 0.0003, $_lng + 0.0003), "id_01");
      ''');
    } catch (_) { rethrow; }
  }

  void _onTapMarker(String id) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(id)));
  }
}
