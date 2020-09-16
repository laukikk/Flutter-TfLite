import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
