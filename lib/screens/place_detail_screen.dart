// to display the details of the place after tapping on the place onn place list screen

import 'package:favourite_places_app/models/place.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});

  final Place place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Stack(
     children: [
      Image.file(place.image,fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
      
     ],
      ),
    );
  }
}
  