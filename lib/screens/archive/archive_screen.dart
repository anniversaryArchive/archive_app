import 'package:archive/models/archive.dart';
import 'package:archive/screens/archive/components/map_view.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArchiveScreen extends StatefulWidget {
  const ArchiveScreen({Key? key}) : super(key: key);

  @override
  _ArchiveScreenState createState() => _ArchiveScreenState();
}

final tempArchive = Archive(id: 'id_01', name: '뿌요카페', lat: 37.55106702139064, lng: 126.92214171381839);

class _ArchiveScreenState extends State<ArchiveScreen> {
  WebViewController? _mapController;    // 지도 Controller
  double _lat = 37.54921196;            // 현재 지도 중앙 위도값
  double _lng = 126.92383907;           // 현재 지도 중앙 경도값
  bool _mapLoaded = false;              // 지도 Load 여부

  final List<Archive> _archives = [tempArchive];  // 카페 리스트

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _clickAddMarkerBtn,
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
              onLoad: _onMapLoad,
            ),
          ],
        ),
      ),
    );
  }

  // Kakao Map Controller initialize
  void _initMapController(WebViewController controller) {
    _mapController = controller;
  }

  // Map Script 실행 시 call
  void _onMapLoad() {
    if (!_mapLoaded) {
      _mapLoaded = true;
      return;
    }
    for (Archive archive in _archives) {
      _addMarker(archive);
    }
  }

  // 사용자가 지도 이동을 멈추면 이벤트가 발생하여 호출된다
  void _onCameraIdle(double lat, double lng) {
    _lat = lat;
    _lng = lng;
  }

  /// Test) Floating Button 클릭 시, Marker 가 추가되게끔 구현
  void _clickAddMarkerBtn() {
    double lat = _lat + 0.0003;
    double lng = _lng + 0.0003;
    String id = 'archive_${_archives.length}';
    Archive archive = Archive(id: id, name: id, lat: lat, lng: lng);
    _archives.add(archive);
    _addMarker(archive);
  }

  void _addMarker(Archive archive) async {
    try {
      await _mapController?.runJavascript('''
        addMarker(new kakao.maps.LatLng(${archive.lat}, ${archive.lng}), "${archive.id}");
      ''');
    } catch (_) { rethrow; }
  }

  // Marker Click 시
  void _onTapMarker(String id) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(id)));
  }
}
