// to show the set location on map by opening the map and letting user set location manually

import 'package:favourite_places_app/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      latitude: 37.4220,
      longitude: -122.0841,
      address: '',
    ),
    this.isSelecting = true,
  });

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isSelecting ? 'pick your location' : 'your location ',
        ),
        actions: [
          if (widget.isSelecting)
            IconButton(
             onPressed: () {
              Navigator.of(context).pop(_pickedLocation);
             },
             icon: const Icon(Icons.save)),
        ],
      ),
      body: GoogleMap(
        onTap: widget.isSelecting==false?null:(postion) {
          setState(() {
            _pickedLocation = postion;
          });
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.location.latitude, widget.location.longitude),
          zoom: 16,
        ),
        markers: (_pickedLocation == null && widget.isSelecting)
            ? {}
            : {
                Marker(
                  markerId: const MarkerId('m1'),
                  position: //_pickedLocation!=null? _pickedLocation!:// or
                      _pickedLocation ?? // dart checks double question mark as u want this value if it is not null otherwise the following value
                      LatLng(
                        widget.location.latitude,
                        widget.location.longitude,
                      ),
                ),
              }, //set data type,
      ),
    );
  }
}
