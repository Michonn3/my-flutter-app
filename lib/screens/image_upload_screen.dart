import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _uploadImage() {
    if (_image == null) return;

    //TODO: Add your upload logic here (e.g., Firebase, API call)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Image Ready for upload: ${_image!.path}')),
    );
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
                child: Text('No image selected'),
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
