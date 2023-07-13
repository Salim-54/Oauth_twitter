import 'package:flutter/material.dart';
import 'package:twitter_login/twitter_login.dart';

class TwitterScreen extends StatefulWidget {
  @override
  _TwitterScreenState createState() => _TwitterScreenState();
}

class _TwitterScreenState extends State<TwitterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twitter Login App'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Login With Twitter'),
          onPressed: () async {
            final twitterLogin = TwitterLogin(
                // Consumer API keys
                apiKey: 'zGXraGMNmMbq8jmshQgMzXlxH',
                // Consumer API Secret keys
                apiSecretKey:
                    '9pITTfWV4EhJw2tSAUg8B2ZirEphsND7R6sAJ0StGgAnmjpBpB',
                // Registered Callback URLs in TwitterApp
                // Android is a deeplink
                // iOS is a URLScheme
                redirectURI:
                    'https://authenticity-v1.firebaseapp.com/__/auth/handler');
            final authResult = await twitterLogin.loginV2();
            switch (authResult.status!) {
              case TwitterLoginStatus.loggedIn:
                // success
                break;
              case TwitterLoginStatus.cancelledByUser:
                // cancel
                break;
              case TwitterLoginStatus.error:
                // error
                break;
            }
          },
        ),
      ),
    );
  }
}
