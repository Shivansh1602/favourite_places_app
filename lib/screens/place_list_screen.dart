  import 'package:favourite_places_app/non_screens_widgets/places_list.dart';
  import 'package:favourite_places_app/providers/user_places.dart';
  import 'package:favourite_places_app/screens/add_place_screen.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_riverpod/flutter_riverpod.dart';

  class PlaceListScreen extends ConsumerWidget {
    const PlaceListScreen({super.key});
    @override
    Widget build(BuildContext context, WidgetRef ref) {
      final userPlaces = ref.watch(
        userPlacesProvider,
      ); // user places stores the list provided by provider that user entered
      return Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: [
            IconButton(
              // button to navigate to addplace screen
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddPlaceScreen()),
                ); // navigation logic
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: PlacesList(places: userPlaces),
      );
    }
  }
