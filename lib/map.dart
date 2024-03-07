import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
void main() {
  runApp( Map());
}
class Map extends StatefulWidget {
 

  @override
  State<Map> createState() => _MyHome_state();
}

class _MyHome_state extends State<Map> {
  
  GoogleMapController ?gmc;
   
  CameraPosition cameraPosition=CameraPosition(target: LatLng(33.504307, 36.304141),zoom: 0);
  List<Marker> markers=[
    //Marker(markerId: MarkerId("1"),position: LatLng(33.504307, 36.304141))

  ];
  @override
  void initState() {
    
    super.initState();
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