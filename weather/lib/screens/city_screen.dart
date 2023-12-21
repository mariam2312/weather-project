// ignore_for_file: use_key_in_widget_constructors, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen();

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/city_background.jpg'),
          fit: BoxFit.cover,
        )),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ),
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      )),
                  onChanged: (value) {
                    print('vvv$value');
                    cityName = value;
                    print('cityName$cityName');
                  },
                ),
              ),
              Container(
                width: 300,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    Navigator.pop(context, cityName);
                    print('ccc$cityName');
                  },
                  child: const Text(
                    'Get Weather',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
