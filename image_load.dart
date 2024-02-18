import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

Future<void> main() async {
  try {
    final response = await http.get(Uri.parse('http://answers.opencv.org/upfiles/logo_2.png'));
    final bytes = response.bodyBytes;

    final image = img.decodeImage(bytes);

    // Do something with the image...
    print(image.width);
    print(image.height);
  } catch (error) {
    print('Error fetching or decoding image: $error');
  }
}