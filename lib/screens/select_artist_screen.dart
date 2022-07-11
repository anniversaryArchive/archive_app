import 'package:archive/api/queries.dart';
import 'package:archive/layouts/default_appbar.dart';
import 'package:archive/models/group.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class SelectArtistScreen extends StatefulWidget {
  const SelectArtistScreen({Key? key}) : super(key: key);

  @override
  _SelectArtistScreenState createState() => _SelectArtistScreenState();
}

class _SelectArtistScreenState extends State<SelectArtistScreen> {
  List<Group> artists = [];

  @override
  void initState() {
    super.initState();
    _getArtistList();
  }

  void _getArtistList() async {
    try {
      QueryResult result = await Queries.getGroups();
      if (result.data?['groups'] == null) { return; }
      List<dynamic> groups = result.data?['groups'];
      print('groups : $groups');
      setState(() {
        artists = groups.map((group) => Group.fromJson(group)).toList();
      });
    } catch (error) { rethrow; }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double logoSize = (width - (25 * 3)) / 3;

    return Scaffold(
      appBar: DefaultAppbar(title: '아티스트 선택'),
      body: GridView.count(
        crossAxisCount: 3,
        children: artists.map<Widget>((Group artist) {
          return Column(
            children: <Widget>[
              Container(
                width: logoSize,
                height: logoSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500.0),
                  color: Colors.white,
                ),
                child: artist.logoPath != null
                  ? ClipRRect(
                    borderRadius: BorderRadius.circular(500.0),
                    child: Image.network(
                      artist.logoPath!,
                    ),
                  ) : Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(500.0),
                    ),
                  ),
              ),
              Text(
                artist.name,
                style: TextStyle(color: Colors.white),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
