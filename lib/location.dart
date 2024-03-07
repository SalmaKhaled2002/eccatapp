import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
void main() {
  runApp( Location());
}
class Location extends StatefulWidget {
 

  @override
  State<Location> createState() => _MyHome();
}

class _MyHome extends State<Location> {
  
  GoogleMapController ?gmc;
   
  CameraPosition cameraPosition=CameraPosition(target: LatLng(33.504307, 36.304141),zoom: 0);
  List<Marker> markers=[];
  StreamSubscription<Position> ?positionStream ;
  initalStream() async{
     bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    
    return Future.error('Location services on device are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.whileInUse) {



     positionStream = Geolocator.getPositionStream().listen(



    (Position? position) {
      markers.add(Marker(markerId: MarkerId("1"),
                position:LatLng(position!.latitude, position.longitude)));
                gmc!.animateCamera(CameraUpdate.newLatLng(LatLng(position.latitude,position.longitude)));
                setState(() {
                  
                });
      
          });
   
  } 

  }
  @override
  void initState() {
    initalStream();
    super.initState();
  }
  @override
  void dispose() {
   positionStream! .cancel();
    super.dispose();
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: Column(
          children: [
            Expanded(child: GoogleMap(
              onTap: (LatLng latlng){
                markers.add(Marker(markerId: MarkerId("1"),
                position:LatLng(latlng.latitude, latlng.longitude)));
                setState(() {
                  
                });
              },
              markers: markers.toSet(),
              initialCameraPosition: cameraPosition
              ,mapType: MapType.normal,
              onMapCreated:(mapcontroller)  {
             gmc=mapcontroller;
            } ))
          ],
        ),
      )
    );
  }
}