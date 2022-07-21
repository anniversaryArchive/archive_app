import 'package:archive/api/queries.dart';
import 'package:archive/components/custom_loading.dart';
import 'package:archive/controllers/data_controller.dart';
import 'package:archive/layouts/default_appbar.dart';
import 'package:archive/models/artist.dart';
import 'package:archive/models/group.dart';
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
    Group group = _dataController.group.value!;

    try {
      QueryResult result = await Queries.getArtists();

      if (result.data?['artists'] != null) {
        List<dynamic> resultData = result.data!['artists'];
        List<Artist> artistList = resultData.map((artist) => Artist.fromJson(artist)).toList();

        /// 그룹 데이터를 Artist 객체에 넣어 리스트에 추가
        Artist groupData = Artist(
          name: group.name,
          createdAt: group.createdAt,
          updatedAt: group.updatedAt,
          debutDate: group.debutDate,
          birthDay: group.debutDate,
          image: group.logo,
        );
        _groupArtists.add(groupData);

        for (var artist in artistList) {
          if (group.id == artist.group?.id) {
            _groupArtists.add(artist);
          }
        }
      }

      setState(() { _isLoading = false; });
    } catch (error) { rethrow; }
  }

  Widget _artistListWidget() {
    return ListView.builder(
      itemCount: _groupArtists.length,
      itemBuilder: (BuildContext context, int index) {
        Artist groupArtist = _groupArtists[index];

        return SelectGroupArtistItem(
          groupArtist: groupArtist,
          onClick: _clickArtist,
        );
      },
    );
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
            : _artistListWidget(),
      ),
    );
  }

  void _clickArtist(Artist artist) {
    _dataController.selectArtist(artist);
    /// TODO 이후 화면전환 로직 필요
  }
}
