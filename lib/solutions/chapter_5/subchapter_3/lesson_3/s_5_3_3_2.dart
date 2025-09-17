import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class S5332 extends StatefulWidget {
  const S5332({super.key});

  @override
  State<S5332> createState() => _S5332State();
}

class _S5332State extends State<S5332> {
  List<File> _images = [];

  void _selectPictures() async {
    final imagePicker = ImagePicker();
    final pickedImages = await imagePicker.pickMultiImage();
    if (pickedImages.isEmpty) return;

    setState(() {
      _images = pickedImages.map((img) => File(img.path)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          IconButton(
              onPressed: _selectPictures, icon: Icon(Icons.photo_library)),
          const SizedBox(height: 16),
          if (_images.isNotEmpty)
            ListView.builder(
                itemCount: _images.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _images.removeAt(index);
                          });
                        },
                        child: SizedBox(
                          width: 200,
                          height: 100,
                          child: Image.file(
                            _images[index],
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ))
        ],
      ),
    );
  }
}
