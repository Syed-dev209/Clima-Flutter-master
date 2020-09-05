import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class GiveMeLocation{
  double lat,lang;


  Future<void> currentLocation ()async
  {
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      lat=position.latitude;
      lang=position.longitude;
      print("Lat:$lat Long:$lang");
    }
    catch(exc)
    {
      print('nahi chal rha code');
    }

  }
}
