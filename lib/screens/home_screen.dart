import 'package:archive/layouts/default_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: '메인화면',
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
