import 'package:archive/models/archive.dart';
import 'package:flutter/material.dart';

class ArchiveItem extends StatelessWidget {
  const ArchiveItem({
    Key? key,
    required this.archive,
  }) : super(key: key);

  final Archive archive;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            archive.archiveName,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            '케이크가 맛있는 한적한 목동카페'
          ),
        ],
      ),
    );
  }
}
