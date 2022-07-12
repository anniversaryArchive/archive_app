// ignore_for_file: slash_for_doc_comments

import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: _onClickLoginWithTwitter,
              icon: Image.asset('assets/icons/twitter.png'),
              iconSize: 50,
            ),
          ],
        ),
      ),
    );
  }

  /**
   * Twitter 로그인 후 서버와의 작업 시
   * authToken / user.id / user.screenName 등을 활용하면 될 것 같습니다
   */
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
