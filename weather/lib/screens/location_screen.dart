// ignore_for_file: use_key_in_widget_constructors, avoid_print, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project11/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  const LocationScreen({this.locationWeather});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temp2;
  String? weatherIcone;
  String? weatherMas;
  String? cityName;
  WeatherModel weatherModel = WeatherModel();
  @override
  void initState() {
    super.initState();
    //widget to get data from lo
    print(widget.locationWeather);
    updateUI(widget.locationWeather);
    // print(jsonDecode(widget.locationWeather)['main']['temp']);
  }

  void updateUI(dynamic currentWeather) {
    setState(() {
      if (currentWeather == null) {
        print(currentWeather);
        temp2 = 0;
        weatherIcone = 'Error';
        weatherMas = 'Unable to get weather data ';
        cityName = '';
        //return to end and not complete code.
        return;
      }
      var temp1 = jsonDecode(currentWeather)['main']['temp'];
      temp2 = temp1.toInt();
      print(temp2);
      var id = jsonDecode(currentWeather)['weather'][0]['id'];
      print(id);
      weatherIcone = weatherModel.getWeatherIcon(id!);
      weatherMas = weatherModel.getMessage(temp2 as int);
      cityName = jsonDecode(currentWeather)['name'];
      print(cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //bacground image
        decoration: BoxDecoration(
            image: DecorationImage(
          image: const AssetImage('images/location_background.jpg'),
          fit: BoxFit.cover,
          //change opacity
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.9), BlendMode.dstATop),
        )),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
            child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () async {
                    var weatherData = await weatherModel.getLocation();
                    updateUI(weatherData);
                  },
                  child: const Icon(
                    Icons.near_me,
                    size: 50.0,
                  ),
                ),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () async {
                    var typeName = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CityScreen();
                    }));
                    print('type$typeName');
                    if (typeName != null) {
                      var weatherData =
                          await weatherModel.getCityWeather(typeName);
                      print('my$weatherData');
                      updateUI(weatherData);
                    }
                  },
                  child: const Icon(
                    Icons.location_city,
                    size: 50.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: <Widget>[
                  Text(
                    '$temp2°',
                    style: const TextStyle(
                        fontSize: 90,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  Text(
                    '$weatherIcone',
                    style: const TextStyle(fontSize: 70),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 10),
              child: Text("$weatherMas in $cityName",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.w900)),
            )
          ],
        )),
      ),
    );
  }
}

/*double temp = jsonDecode(data)['main']['temp'];
    print(temp);
    int id = jsonDecode(data)['weather'][0]['id'];
    print(id);
    String name = jsonDecode(data)['name'];
    print(name);*/
