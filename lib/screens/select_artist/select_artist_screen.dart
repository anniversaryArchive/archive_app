import 'package:archive/api/queries.dart';
import 'package:archive/components/custom_loading.dart';
import 'package:archive/controllers/data_controller.dart';
import 'package:archive/layouts/default_appbar.dart';
import 'package:archive/models/group.dart';
import 'package:archive/screens/select_artist/components/artist_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

class SelectArtistScreen extends StatefulWidget {
  const SelectArtistScreen({Key? key}) : super(key: key);

  @override
  _SelectArtistScreenState createState() => _SelectArtistScreenState();
}

class _SelectArtistScreenState extends State<SelectArtistScreen> {
  final DataController _dataController = Get.find<DataController>();

  late Size _size;
  List<Group> _artists = [];
  bool _isLoading = true;

  double get _logoSize => (_size.width - (25 * 3)) / 3;
  double get _nameHeight => 30.0;

  @override
  void initState() {
    super.initState();
    _getArtistList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _size = MediaQuery.of(context).size;
  }

  /// Artist List 를 서버에서 받아온다.
  /// * 성공적으로 데이터를 받아왔을 경우, _isLoading 을 false 로 바꾸어준다.
  void _getArtistList() async {
    try {
      QueryResult result = await Queries.getGroups();
      if (result.data?['groups'] == null) { return; }
      List<dynamic> groups = result.data?['groups'];
      _artists = groups.map((group) => Group.fromJson(group)).toList();
      setState(() { _isLoading = false; });
    } catch (error) { rethrow; }
  }

  Widget _buildArtistGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: _logoSize / (_logoSize + _nameHeight),
      ),
      itemCount: _artists.length,
      itemBuilder: (BuildContext context, int index) {
        Group artist = _artists[index];
        return ArtistItem(
          artist: artist,
          logoSize: _logoSize,
          nameHeight: _nameHeight,
          onClick: _clickArtist,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(title: '아티스트 선택'),
      body: _isLoading
        ? CustomLoading()
        : _buildArtistGridView(),
    );
  }

  void _clickArtist(Group artist) {
    _dataController.selectGroup(artist);
    Get.toNamed('/select-member');
  }
}
