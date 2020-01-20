import 'package:flutter/material.dart';
class TabScreen extends StatelessWidget{
  final String listType;

  TabScreen(this.listType);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              listType,
              style: Theme.of(context).textTheme.display2,
            )
          ],
        ),
      ),
    );
  }

}