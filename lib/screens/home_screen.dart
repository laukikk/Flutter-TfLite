import 'package:TfLite/screens/all_models.dart';
import 'package:TfLite/screens/camera_screen.dart';
import 'package:flutter/material.dart';
import 'file_upload_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Open Camera'),
              onPressed: () {
                Navigator.pushNamed(context, CameraScreen.id);
              },
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              child: Text('Get Image'),
              onPressed: () {
                Navigator.pushNamed(context, FileScreen.id);
              },
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              child: Text('All Models'),
              onPressed: () {
                Navigator.pushNamed(context, AllModels.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
