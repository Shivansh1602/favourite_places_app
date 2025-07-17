// to display the list on placeslist screen

import 'package:favourite_places_app/models/place.dart';
import 'package:favourite_places_app/screens/place_detail_screen.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});
  final List<Place> places; // variable to store model of place

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      // to check if the list to be displayed is empty or not
      return Center(
        child: Text(
          ' No Places added yet',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,                                                                                      // counts the total item in the list to be rendered for flutter
      itemBuilder: (context, index) => ListTile(
        // build a list based on the index using list tile
        title: Text(
          places[index].title,                                              //to get the parameter 'title' we used index
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        onTap: () {
          // triggered when user taps listitem
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PlaceDetailScreen(place: places[index]),// navigated to the places detail screen by index of the place
            ),
          );
        },
      ),
    );
  }
}
