import 'package:archive/models/artist.dart';
import 'package:archive/utils/date_helper.dart';
import 'package:flutter/material.dart';

class SelectGroupArtistItem extends StatelessWidget {
  final Artist groupArtist;
  final Function(Artist) onClick;

  const SelectGroupArtistItem({Key? key, required this.groupArtist, required this.onClick}) : super(key: key);

  Widget _artistImageWidget() {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: groupArtist.imagePath != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.network(groupArtist.imagePath!),
            )
          : Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
    );
  }

  Widget _artistInfoWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(groupArtist.name),
            Text(formatDate(groupArtist.birthDay)),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(groupArtist),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 11.0),
        child: Row(
          children: [
            _artistImageWidget(),
            _artistInfoWidget(),
          ],
        ),
      ),
    );
  }
}
