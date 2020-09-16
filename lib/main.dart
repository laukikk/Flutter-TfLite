import 'package:TfLite/screens/camera_screen.dart';
import 'package:TfLite/screens/file_upload_screen.dart';
import 'package:TfLite/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:TfLite/screens/all_models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        CameraScreen.id: (context) => CameraScreen(),
        FileScreen.id: (context) => FileScreen(),
        AllModels.id: (context) => AllModels(),
      },
    );
  }
}
