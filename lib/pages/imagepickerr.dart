import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class ImagePickerr extends StatefulWidget {
  const ImagePickerr({Key? key}) : super(key: key);

  @override
  _ImagePickerrState createState() => _ImagePickerrState();
}

class _ImagePickerrState extends State<ImagePickerr> {
  File? file;
  String? url;

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        file = File(image.path);
      });

      String imageName = path.basename(image.path);
      Reference refStorage = FirebaseStorage.instance.ref(imageName);
      await refStorage.putFile(file!);

      url = await refStorage.getDownloadURL();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: SafeArea(
              child: Column(
        children: [
          if (url == null)
            Container(
              height: 200,
              width: 200,
              color: Colors.black26,
            ),
          if (url != null)
            Container(
              color: Colors.black12,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(10),
              child:
                  CircleAvatar(radius: 55, backgroundImage: NetworkImage(url!)),
            ),
        ],
      ))),
      appBar: AppBar(
        title: Text(
          'Image Picker',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: getImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 16),
            if (file == null)
              Container(
                color: Colors.black12,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(10),
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/abstract-glowin%E2%80%A6on-generative-ai_188544-8092.jpg?size=626&ext=jpg',
                  ),
                ),
              ),
            if (file != null)
              Container(
                color: Colors.black12,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(10),
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: FileImage(file!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}