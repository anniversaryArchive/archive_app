import 'package:archive/api/queries.dart';
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
  late String groupId = Get.parameters['id'] as String;
  late List<Artist> groupArtists;

  void _getGroupArtist() async {
    QueryResult result = await Queries.getArtists();
    if (result.data?['artists'] != null) {
      List<Artist> artists = result.data?['artists'].map((artist) => Artist.fromJson(artist)).toList();
      
      artists.forEach((artist) {
        if(artist.group.id == groupId) {
          groupArtists.add(artist);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: '그룹 내 아티스트 선택',
      ),
      body: SafeArea(
        bottom: false,
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              Artist groupArtist = groupArtists[index];

              return SelectGroupArtistItem(
                groupArtist: groupArtist,
              );
            }),
      ),
    );
  }
}
