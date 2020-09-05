import 'package:flutter/material.dart';
import 'Location_getting.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/location_screen.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double lat,long;
  void getLocationData
      () async
  {
    WeatherModel weather = WeatherModel();
    var weatherData= await weather.locationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen( locationWeather: weatherData,);
    }));


  }

  @override
  void initState() {
   super.initState();
   getLocationData();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
