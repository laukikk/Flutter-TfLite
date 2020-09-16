import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'dart:io';

class FileScreen extends StatefulWidget {
  static const String id = 'file_upload_screen';

  @override
  _FileScreenState createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  File _image;
  final _picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future loadModel() async {
    Tflite.close();
    try {
      String res = await Tflite.loadModel(
          model: "assets/mobilenet_v1_1.0_224_1_default_1.tflite",
          labels: "assets/labels.txt",
          numThreads: 1, // defaults to 1
          isAsset:
              true, // defaults to true, set to false to load resources outside assets
          useGpuDelegate:
              false // defaults to false, set to true to use GPU delegate
          );
      print(res);
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Center(
        child: _image == null ? Text('No image selected.') : Image.file(_image),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              getImage(ImageSource.camera);
            },
            heroTag: 'image0',
            tooltip: 'Pick Image',
            child: Icon(Icons.add_a_photo),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: FloatingActionButton(
              onPressed: () {
                getImage(ImageSource.gallery);
              },
              heroTag: 'image1',
              tooltip: 'Pick Image from gallery',
              child: const Icon(Icons.photo_library),
            ),
          )
        ],
      ),
    );
  }
}
