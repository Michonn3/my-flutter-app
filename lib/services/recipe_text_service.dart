import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

/*
  Responsible for converting receipt images into text.
  This class should ONLY worry about OCR.
  It should not know anything about MongoDB,
  Express, grocery items, or UI widgets.
*/
class ReceiptTextService {
  final ImagePicker _picker = ImagePicker();

  // Opens camera, captures image, sends image to Google ML Kit,
  // returns recognized text.
  Future<String?> scanReceiptFromCamera() async {
    // Ask user to take a picture
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image == null) return null;

    // Convert image file into ML Kit format
    final inputImage = InputImage.fromFilePath(image.path);

    // Create OCR engine
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    try {
      // perform OCR
      final RecognizedText recognizedText = await textRecognizer.processImage(
        inputImage,
      );

      // Return all text found in image
      return recognizedText.text;
    } finally {
      // Prevent memory leaks
      await textRecognizer.close();
    }
  }
}
