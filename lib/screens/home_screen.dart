import 'package:archive/dialogs/login_dialog.dart';
import 'package:archive/layouts/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buildDrawer() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget>[
          Spacer(),
          ElevatedButton(
            onPressed: _showLoginDialog,
            child: Text('Login'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(title: '메인화면'),
      drawer: _buildDrawer(),
      body: Center(
        child: Text('Home'),
      ),
    );
  }

  void _showLoginDialog() {
    Get.dialog(LoginDialog());
  }
}
