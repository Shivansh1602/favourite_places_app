//holds the image input logic ,, alllows user to open device camera show a preview of the image that was taken , pass the image back to the add place screen to be added to the place that is being created
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  ImageInput({super.key});
  @override
  State<ImageInput> createState() {
    return _ImageInput();
  }
}

class _ImageInput extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
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
      child: TextButton.icon(
        icon: const Icon(Icons.camera),
        label: const Text('Take Picture'),
        onPressed: () {},
      ),
    );
  }
}
