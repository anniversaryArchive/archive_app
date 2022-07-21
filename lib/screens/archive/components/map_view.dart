import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapView extends StatelessWidget {
  MapView({
    Key? key,
    required this.lat,
    required this.lng,
    required this.initMapController,
    required this.onCameraIdle,
    required this.onTapMarker,
    required this.onLoad,
  }) : super(key: key);

  final double lat;
  final double lng;
  final Function(WebViewController) initMapController;
  final Function(double, double) onCameraIdle;
  final Function(String) onTapMarker;
  final VoidCallback onLoad;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return KakaoMapView(
      width: size.width,
      height: size.height,
      kakaoMapKey: dotenv.env['KAKAO_MAP_KEY'] ?? '',
      lat: lat,
      lng: lng,
      showMapTypeControl: true,
      showZoomControl: true,
      mapController: initMapController,
      customScript: '''
        $mapCustomScript
        ${_onLoad()}
      ''',
      onTapMarker: _onTapMarker,
      cameraIdle: _onCameraIdle,
    );
  }

  String _onLoad() {
    onLoad();
    return '';
  }

  void _onTapMarker(JavascriptMessage message) {
    String id = message.message;
    onTapMarker(id);
  }

  void _onCameraIdle(JavascriptMessage message) {
    KakaoLatLng latLng = KakaoLatLng.fromJson(jsonDecode(message.message));
    onCameraIdle(latLng.lat ?? lat, latLng.lng ?? lng);
  }
}

const mapCustomScript = '''
  var markers = [];

  function addMarker(position, id) {
    var marker = new kakao.maps.Marker({position: position});
    marker.setMap(map);
    markers.push(marker);
            
    kakao.maps.event.addListener(marker, 'click', (function(id) {
      return function(){
        onTapMarker.postMessage(id);
      };
    })(id));
  }
      
  kakao.maps.event.addListener(map, 'dragend', function() {        
    const latlng = map.getCenter();
    const idleLatLng = { lat: latlng.getLat(), lng: latlng.getLng() }
    cameraIdle.postMessage(JSON.stringify(idleLatLng));
  });

  var zoomControl = new kakao.maps.ZoomControl();
  map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

  var mapTypeControl = new kakao.maps.MapTypeControl();
  map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
''';
