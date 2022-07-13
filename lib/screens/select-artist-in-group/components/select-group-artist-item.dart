import 'package:flutter/material.dart';

class SelectGroupArtistItem extends StatelessWidget {
  const SelectGroupArtistItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          child: Image.asset('name'),
        ),
        Column(
          children: [
            Text('셔누'),
            Text('96.01.03'),
          ],
        ),
      ],
    );
  }

}