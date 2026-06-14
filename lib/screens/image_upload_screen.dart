import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/*
   The screen class blueprint. `StatefulWidget`means this screen 
   can change while the app is running. `ImageUploadScreen()`
   is the constructor. It lets other files create this screen when 
   the `ImageUploadScreen()` constructor is called. 
   `createState() => _ImageUploadeScreenState()` means use the 
   _ImageUploadScreenState class below to control the changing 
   data for this screen.

*/
class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

/*
  The _ImageUploadScreenState class controls the changing state
  for the ImageUploadScreen class. This is where the screen's 
  memory lives. The _pickImage() function opens either the camera
  or gallery and waits for the user to select something. If the
  user selected something, setState() tells Flutter "the data
  changed. Redraw the screen." The _uploadImage function is
  supposed to actually upload to a database/server, but is 
  pending implementation.

*/
class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile == null) {
      return;
    }

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  void _uploadImage() {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please choose an image first.')),
      );
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Image ready: ${_image!.path}')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Image')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_image != null)
              Image.file(_image!, height: 200)
            else
              Container(
                height: 200,
                color: Colors.grey[300],
                alignment: Alignment.center,
                child: const Text('No image selected'),
              ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.photo_library),
                  label: Text('Gallery'),
                  onPressed: () => _pickImage(ImageSource.gallery),
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.camera_alt),
                  label: Text('Camera'),
                  onPressed: () => _pickImage(ImageSource.camera),
                ),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              icon: Icon(Icons.upload_file),
              label: Text('Upload Image'),
              onPressed: _uploadImage,
            ),
          ],
        ),
      ),
    );
  }
}
