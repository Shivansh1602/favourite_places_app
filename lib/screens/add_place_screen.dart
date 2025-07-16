// add button screen to take input elements  from the users , allows a user too input data for the new place

import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController =
      TextEditingController(); //value to be passed in controller
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
        padding: const EdgeInsets.all(12 ),
        child: Column(
          
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller:
                  _titleController, //to make sure user input is managed by flutter and can be accessed when needed later
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Add pace'),// button to add place 
            ),
          ],
        ),
      ),
    );
  }
}
