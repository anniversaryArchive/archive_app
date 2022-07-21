import 'package:archive/models/group.dart';
import 'package:flutter/material.dart';

class ArtistItem extends StatelessWidget {
  const ArtistItem({
    Key? key,
    required this.artist,
    this.logoSize = 50.0,
    this.nameHeight = 30.0,
    required this.onClick,
  }) : super(key: key);

  final Group artist;
  final double logoSize;
  final double nameHeight;
  final Function(Group) onClick;

  Widget _buildArtistLogo() {
    BorderRadius radius = BorderRadius.circular(logoSize);
    BoxDecoration decoration = BoxDecoration(color: Colors.white, borderRadius: radius);

    return Container(
      width: logoSize,
      height: logoSize,
      decoration: decoration.copyWith(color: Colors.grey),
      child: artist.logoPath != null
          ? ClipRRect(
        borderRadius: radius,
        child: Image.network(artist.logoPath!),
      ) : Container(decoration: decoration),
    );
  }

  Widget _buildArtistName(BuildContext context) {
    return Container(
      height: nameHeight,
      alignment: Alignment.bottomCenter,
      child: Text(
        artist.name,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(artist),
      child: Column(
        children: <Widget>[
          _buildArtistLogo(),
          _buildArtistName(context),
        ],
      ),
    );
  }
}
