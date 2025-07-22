// to input location
import 'dart:convert'; //provides json

import 'package:favourite_places_app/models/place.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  const LocationInput({super.key,required this.onSelectLocation});

  final void Function(PlaceLocation location) onSelectLocation;


  @override
  State<LocationInput> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLocation;//  to store the location (lat,lng,address)
  var _isGettingLocation = false; // made to show a loading spinner

  String get locationImage{// getter to generate the snapsot and  the preveiw of the location using api 
  if(_pickedLocation==null){
    return '';
  }
   final lat=_pickedLocation!.latitude;
   final lng=_pickedLocation!.longitude; 
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng=&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=AIzaSyA7YcZDD-oOc2vxzW6Jd4esE0PPYUPw2yk';
  }

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;
    if (lat == null || lng == null) {
      return;
    }

    final url = Uri.parse(
      "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyA7YcZDD-oOc2vxzW6Jd4esE0PPYUPw2yk",
    );

    final response = await http.get(url);

    final resdata = json.decode(response.body);
    final address =
        resdata['results'][0]['formatted_address']; // human readable address by converting longitude and latitude in human readable address using google maps api reverse geocoding

    setState(() {
      _pickedLocation = PlaceLocation(
        latitude: lat,
        longitude: lng,
        address: address,
      );
      _isGettingLocation = false;
    });
    widget.onSelectLocation(_pickedLocation!);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = 
    Text( 'No location ',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );

    if(_pickedLocation!=null){
      previewContent=Image.network(locationImage,fit: BoxFit.cover,width: double.infinity,height: double.infinity,);
    }

    if (_isGettingLocation == true) {
    
         previewContent = const Center(child: CircularProgressIndicator());
     
     
    }

    return Column(
      children: [
        Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withAlpha(
                51,
              ), // withValues fixed to withAlpha
            ),
          ),
          child: previewContent, // to show the loading spinner
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              label: Text('Get Current Location'),
              icon: Icon(Icons.location_on),
            ),
            TextButton.icon(
              onPressed: () {},
              label: Text('Select on Map'),
              icon: Icon(Icons.map),
            ),
          ],
        ),
      ],
    );
  }
}
