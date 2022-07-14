import 'package:archive/models/artist.dart';
import 'package:archive/utils/date_helper.dart';
import 'package:flutter/material.dart';

class SelectGroupArtistItem extends StatelessWidget {
  final Artist groupArtist;

  const SelectGroupArtistItem({Key? key, required this.groupArtist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: groupArtist.imagePath != null
                ? Image.network(groupArtist.imagePath!)
                : Container(
                    color: Colors.grey,
                  ),
          ),
          Column(
            children: [
              Text(groupArtist.name),
              Text(formatDate(groupArtist.birthDay)),
            ],
          ),
        ],
      ),
    );
  }
}
