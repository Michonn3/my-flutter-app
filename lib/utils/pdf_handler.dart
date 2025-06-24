import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//

Future<void> openHEBHomepage() async {
  final url = Uri.parse('https://www.heb.com');
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch H-E-B homepage';
  }
}

/* Main Widget: FilePicker 
 * Defines a StatelessWidget named FilePicker. It returns a MaterialApp
 *  with a title and sets the home screen to FilePickerHomePage. 
 */
class FilePickerApp extends StatelessWidget {
  const FilePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upload Recipes',
      home: FilePickerHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/* Home Page Widget (Stateful) 
* Defines a StatefulWidget called FilePickerHomePage. It can update its 
* UI based on user actions (like picking a file).
*/
class FilePickerHomePage extends StatefulWidget {
  const FilePickerHomePage({super.key});

  @override
  FilePickerHomePageState createState() => FilePickerHomePageState();
}

/* State Class 
*  Holds the state for the home page
* _fileName stores the name of the selected file.
*/
class FilePickerHomePageState extends State<FilePickerHomePage> {
  String? _fileName;

  // File Picking logic : When the user taps the button, _pickFile()
  // is called. If a file is selected, it sets _fileName to the file's
  // name. If canceled, it shows "No file selected."
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

  // UI Layout
  // Scaffold: Provides the basic visual layout.
  // AppBar: Displays a top title bar.
  // ElevatedButton: When pressed, calls _pickFile;
  // Text: Displays the file name (or a placeholder if none is selected.)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload File')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _pickFile, child: Text('Pick a file')),
            SizedBox(height: 20),
            Text(
              _fileName ?? 'No file selected yet.',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: openHEBHomepage,
              child: Text('Go to H-E-B'),
            ),
          ],
        ),
      ),
    );
  }
}
