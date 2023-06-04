import 'package:fixgreen/android/styles.dart';
import 'package:fixgreen/android/views/details_truck.view.dart';
import 'package:fixgreen/android/views/editor_truck.view.dart';
import 'package:fixgreen/models/truck.model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 10,
        title: Text("Meus caminhões"),
        centerTitle: true,
        leading: TextButton(
          onPressed: () {},
          child: Icon(
            Icons.search,
            color: Theme.of(context).primaryColor
          )
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Teste"),
            subtitle: Text("Testado"),
            trailing: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsTruckView(),
                  ),
                );
              },
              child: Icon(
                Icons.chat,
                color: Theme.of(context).primaryColor
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => EditorTruckView(
                model: TruckModel(
                  id: 0
                )
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: accentColor,
        ),
      ),
    );
  }
}