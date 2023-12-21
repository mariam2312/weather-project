// ignore_for_file: unused_local_variable, use_key_in_widget_constructors, camel_case_types, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'services/weather.dart';
import 'screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen();

  @override
  State<LoadingScreen> createState() => _loadingScreenState();
}

class _loadingScreenState extends State<LoadingScreen> {
  //double? longitude;
  //double? latitude;
  @override
  // get location when open app
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    //object
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocation();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        //SpinKitRotatingCircle-> load before data come
          child: SpinKitRotatingCircle(
        color: Colors.white,
        size: 50.0,
      )),
    );
  }
}
