import 'package:archive/layouts/default_appbar.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(title: '메인화면'),
      drawer: Column(
        children: <Widget>[
          Spacer(),
          ElevatedButton(
            onPressed: _onClickLoginWithTwitter,
            child: Text('Login With Twitter'),
          ),
        ],
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }

  void _onClickLoginWithTwitter() async {
    final TwitterLogin twitterLogin = TwitterLogin(
      apiKey: dotenv.env['TWITTER_API_KEY'] ?? '',
      apiSecretKey: dotenv.env['TWITTER_API_SECRET_KEY'] ?? '',
      redirectURI: 'archive://',
    );
    try {
      final AuthResult authResult = await twitterLogin.login();
      switch (authResult.status) {
        case TwitterLoginStatus.loggedIn:
          if (kDebugMode) { print('chloe test success !!'); }
          // TODO: Login Success 후 로직 _ 서버와의 통신 필요
          if (Get.context != null) { Navigator.of(Get.context!).pop(); }
          break;
        case TwitterLoginStatus.cancelledByUser:
          break;
        case TwitterLoginStatus.error:
          break;
        default: break;
      }
    } catch (_) { rethrow; }
  }
}
