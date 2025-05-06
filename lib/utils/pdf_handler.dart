import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Upload Recipes', home: FilePickerHomePage());
  }
}

class FilePickerHomePage extends StatefulWidget {
  const FilePickerHomePage({Key? key}) : super(key: key);
  
  @override
  _FilePickerHomePageState createState() => _FilePickerHomePageState();
}

class _FilePickerHomePageState extends State<FilePickerHomePage> {
  String? _fileName;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.first.name;
      });
    } else {
      // User canceled the picker
      setState(() {
        _fileName = 'No file selected.';
      });
    }
  }


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('File Picker'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: : _pickFile,
            child: Text('Pick a file'),
           ),
           SizedBox(height: 20),
           Text(
              _fileName ?? 'No file selected yet.',
              style: TextStyle(fontSize: 16),
           ),
        ],
      ),
    ),
  );
}
}