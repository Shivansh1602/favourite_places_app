import 'package:favourite_places_app/non_screens_widgets/places_list.dart';
import 'package:favourite_places_app/screens/add_place_screen.dart';
import 'package:flutter/material.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [IconButton(// button to navigate to addplace screen 
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const  AddPlaceScreen(),));// navigation logic 
        }, 
        icon: Icon(Icons.add))],
      ),
      body: PlacesList(places: []),
    );
  }
}
