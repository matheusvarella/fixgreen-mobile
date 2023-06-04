import 'package:flutter/material.dart';

import 'styles.dart';

class SplashView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          Icon(
            Icons.fingerprint,
            size: 72,
            color: accentColor,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Vou mudar",
            style: TextStyle(
              fontSize: 24,
              color: accentColor,
            ),
          ),
        ],
      )
    );
  }
}