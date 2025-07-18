//holds the image input logic ,, alllows user to open device camera show a preview of the image that was taken , pass the image back to the add place screen to be added to the place that is being created
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() {
    return _ImageInput();
  }
}

class _ImageInput extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() async {
    // mehtod to open camera and click the image
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    }
    _selectedImage = File( pickedImage.path,); // changed the XFILE type of pcikedimage to normal File type and stored it in _selected image which of type File ,, here the File object stores the path of Xfile picked image
  }

  @override
  Widget build(BuildContext context) {
    Widget content=TextButton.icon(
        icon: const Icon(Icons.camera),
        label: const Text('Take Picture'),
        onPressed: _takePicture,
      );

      if(_selectedImage!=null ){
        content= Image.file(_selectedImage!,fit: BoxFit.fill,);
      }


    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
        ),
      ),

      height: 250,
      width: double.infinity,
      alignment: Alignment
          .center, //allligns the child widget which is button in the centre of the container
      child:content 
    );
  }
}
