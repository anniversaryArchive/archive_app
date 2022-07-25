import 'package:archive/models/artist.dart';
import 'package:archive/utils/date_helper.dart';
import 'package:flutter/material.dart';

class SelectGroupArtistItem extends StatelessWidget {
  final Artist groupArtist;
  final VoidCallback onClick;

  const SelectGroupArtistItem({Key? key, required this.groupArtist, required this.onClick}) : super(key: key);

  Widget _artistImageWidget() {
    double imageSize = 50.0;
    BorderRadius imageRadius = BorderRadius.circular(imageSize);

    return Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: imageRadius,
      ),
      child: groupArtist.imagePath != null
          ? ClipRRect(
              borderRadius: imageRadius,
              child: Image.network(groupArtist.imagePath!),
            )
          : Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: imageRadius,
              ),
            ),
    );
  }

  Widget _artistInfoWidget(context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(groupArtist.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 17),
          ),
          Text(
            formatDate(groupArtist.birthDay),
            style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick.call(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 11.0),
        child: Row(
          children: [
            _artistImageWidget(),
            _artistInfoWidget(context),
          ],
        ),
      ),
    );
  }
}
