import 'package:archive/api/queries.dart';
import 'package:archive/layouts/default_appbar.dart';
import 'package:archive/screens/select-artist-in-group/components/select-group-artist-item.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class SelectGroupArtistScreen extends StatefulWidget {
  const SelectGroupArtistScreen({Key? key}) : super(key: key);

  @override
  _SelectGroupArtistState createState() => _SelectGroupArtistState();
}

class _SelectGroupArtistState extends State<SelectGroupArtistScreen> {

  void _getGroupArtist() async {
    // QueryResult result = Queries.getArtists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: '그룹 내 아티스트 선택',
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return SelectGroupArtistItem();
            }),
      ),
    );
  }
}
