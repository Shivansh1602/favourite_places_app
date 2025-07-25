// add button screen to take input elements  from the users , allows a user too input data for the new place

import 'package:favourite_places_app/models/place.dart';
import 'package:favourite_places_app/non_screens_widgets/image_input.dart';
import 'package:favourite_places_app/non_screens_widgets/location_input.dart';
import 'package:favourite_places_app/providers/user_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  //value to be passed in controller

  File? _selectedImage;

  PlaceLocation? _selectedLocation;

  void _savedPlaces() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty || _selectedImage == null||_selectedLocation==null) {
      // is list is empty we show a dialog box
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('input required'),
          content: Text('Please enter a place title before saving '),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );

      return;
    }
    ref
    .read(userPlacesProvider.notifier) 
    .addPlace(enteredTitle, _selectedImage!,_selectedLocation!);
     // returning the provider if list is not empty
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    //disposing the controller
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new List')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller:_titleController, //to make sure user input is managed by flutter and can be accessed when needed later
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),

            const SizedBox(height: 10),

            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
           const SizedBox(height: 16),
            
            LocationInput(onSelectLocation: (location) {
              _selectedLocation=location;
            },),

            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _savedPlaces,
              icon: Icon(Icons.add),
              label: Text('Add place'), // button to add place
            ),
          ],
        ),
      ),
    );
  }
}
