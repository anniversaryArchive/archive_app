import 'package:archive/api/queries.dart';
import 'package:archive/components/custom_loading.dart';
import 'package:archive/controllers/data_controller.dart';
import 'package:archive/layouts/default_appbar.dart';
import 'package:archive/models/artist.dart';
import 'package:archive/screens/select-artist-in-group/components/select-group-artist-item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

class SelectGroupArtistScreen extends StatefulWidget {
  const SelectGroupArtistScreen({Key? key}) : super(key: key);

  @override
  _SelectGroupArtistState createState() => _SelectGroupArtistState();
}

class _SelectGroupArtistState extends State<SelectGroupArtistScreen> {
  final DataController _dataController = Get.find<DataController>();
  final List<Artist> _groupArtists = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _getGroupArtist();
  }

  void _getGroupArtist() async {
    try {
      QueryResult result = await Queries.getArtists();

      if (result.data?['artists'] != null) {
        List<dynamic> artistsResult = result.data?['artists'];
        List<Artist> artistList = artistsResult.map((artist) => Artist.fromJson(artist)).toList();
        for (var artist in artistList) {
          if (_dataController.group.value?.id == artist.group?.id) {
            _groupArtists.add(artist);
          }
        }
      }

      setState(() { _isLoading = false; });
    } catch (error) { rethrow; }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: '그룹 내 아티스트 선택',
      ),
      body: SafeArea(
        bottom: false,
        child: _isLoading
            ? CustomLoading()
            : ListView.builder(
                itemCount: _groupArtists.length,
                itemBuilder: (BuildContext context, int index) {
                  Artist groupArtist = _groupArtists[index];

                  return SelectGroupArtistItem(
                    groupArtist: groupArtist,
                  );
                }),
      ),
    );
  }
}
