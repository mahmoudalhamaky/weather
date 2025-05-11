import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
 late double lat;
 late double long;
 late String timeNow;

Future<void> CurrentLocation ()async{

      try{
        final  LocationSettings locationSettings = LocationSettings(accuracy: LocationAccuracy.high,);
        Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
        lat = position.latitude;
        long= position.longitude;
        timeNow=position.timestamp.toString() ;
         }

      catch(e){
        print('$e');
    }


}




  @override
 Widget build (BuildContext context) {
    return Scaffold();
  }

}