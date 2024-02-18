import 'dart:io';

List<List<List<int>>> convertToMatrix(List<int> flattenedImage, List<int> shape) {
  int totalElements = shape.reduce((a, b) => a * b);
  if (totalElements != flattenedImage.length) {
    throw ArgumentError('Shape does not match the length of flattened image.');
  }

  List<List<List<int>>> matrix = List.generate(
    shape[0],
    (_) => List.generate(
      shape[1],
      (_) => List.generate(
        shape[2],
        (_) => 0, // Assuming the elements are integers
      ),
    ),
  );

  int index = 0;
  for (int i = 0; i < shape[0]; i++) {
    for (int j = 0; j < shape[1]; j++) {
      for (int k = 0; k < shape[2]; k++) {
        matrix[i][j][k] = flattenedImage[index++];
      }
    }
  }

  return matrix;
}

Future<void> main() async {
  try {
    // Read flattened image from text file
    List<String> lines = await File('image_matrix.txt').readAsLines();
    List<int> flattenedImage = lines.map(int.parse).toList();

    // Read shape from another text file
    List<String> shapeLines = await File('image_shape.txt').readAsLines();
    List<int> shape = shapeLines.map(int.parse).toList();

    // Convert flattened image to matrix
    List<List<List<int>>> matrix = convertToMatrix(flattenedImage, shape);

    // Print the reconstructed matrix
    print(matrix);
  } catch (e) {
    print('Error: $e');
  }
}
