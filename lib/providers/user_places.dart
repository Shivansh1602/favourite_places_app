// responsible for managing places selected by the user or added by the user
// creating to add a new place

import 'package:favourite_places_app/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

// notifier class to to manipulate tha methods to manage the state thats managed by riverpod

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super( const []);
    
     // const is added so that we do not mutate the list that already exists in the memory by mistake otherwise the code will not run

  void addPlace(String title, File image) {
    final newPlace = Place(title: title,image: image);
    state = [newPlace, ...state]; 

    //using spreader ... to get the emlements of old list in new and adding the neew place at the beginning of the list
  }
}

final userPlacesProvider = StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) => UserPlacesNotifier(),
);//using ref we can communicate to other providers , here we return an instance of UserPlacesNotifier class