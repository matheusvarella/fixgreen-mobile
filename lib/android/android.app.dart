import 'package:fixgreen/android/styles.dart';
import 'package:fixgreen/android/views/home.view.dart';
import 'package:flutter/material.dart';

class AndroidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
      title: 'Caminhão',
      debugShowCheckedModeBanner: false,
      theme: androidTheme(),
      home: HomeView(),
    );
  }
}