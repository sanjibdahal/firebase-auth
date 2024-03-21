// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:image_picker_web/image_picker_web.dart';

// class ImagePickerExample extends StatefulWidget {
//   const ImagePickerExample({super.key});

//   @override
//   State<ImagePickerExample> createState() => _ImagePickerExampleState();
// }

// class _ImagePickerExampleState extends State<ImagePickerExample> {
//   // XFile? _image;
//   bool isAvailable = false;
//   Uint8List? imageFile;
//   // File? imageFile;

//   // Future<void> _getImage() async {
//   //   XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
//   //   setState(() {
//   //     _image = image;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Image Picker Example'),
//       ),
//       body: Center(
//         child: imageFile == null
//             ? const Text('No image selected.')
//             : Image.memory(
//                 imageFile!,
//                 width: 300,
//                 height: 300,
//                 fit: BoxFit.cover,
//               ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final image = await ImagePickerWeb.getImageAsBytes();
//           setState(() {
//             imageFile = image;
//             isAvailable = true;
//           });
//         },
//         tooltip: 'Pick Image',
//         child: const Icon(Icons.add_a_photo),
//       ),
//     );
//   }
// }
