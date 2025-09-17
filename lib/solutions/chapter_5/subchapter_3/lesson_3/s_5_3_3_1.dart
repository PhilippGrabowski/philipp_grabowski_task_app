import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class S5331 extends StatefulWidget {
  const S5331({super.key});

  @override
  State<S5331> createState() => _S5331State();
}

class _S5331State extends State<S5331> {
  File? _image;

  void _takeAPicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage == null) return;
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  void _selectPictureFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Text(
      'Select Image',
      style: TextStyle(color: Colors.blueGrey),
    );

    if (_image != null) {
      content = Image.file(
        _image!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: _takeAPicture, icon: Icon(Icons.add_a_photo)),
              IconButton(
                  onPressed: _selectPictureFromGallery,
                  icon: Icon(Icons.photo_library))
            ],
          ),
          const SizedBox(height: 16),
          Container(
              width: 300,
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(36, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(16)),
              child: content)
        ],
      ),
    );
  }
}
