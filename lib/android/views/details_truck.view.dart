import 'package:fixgreen/android/styles.dart';
import 'package:flutter/material.dart';

class DetailsTruckView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Caminhão"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 10,
      ),
      body: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
              width: double.infinity,
            ),
            Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: Icon(
            Icons.edit,
            color: accentColor,
          ),
        ),
    );
  }
}