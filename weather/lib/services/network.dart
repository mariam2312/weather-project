// as -> but http before anything that is inside this package -> to ture that fun name not repeate .

// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
//import 'dart:convert';

class Network {
  final String url;
  Network(this.url);

  //get weather data from open weather app.
  //get return future response
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    //https://api.openweathermap.org/data/2.5/weather?lat=37.42342342342342&lon=-122.10664084613394&appid=72689e5d13f1617eb1db9783e801d1b5
    //https://api.openweathermap.org/data/2.5/weather?lat=37.42342342342342&lon=-122.10664084613394&appid=72689e5d13f1617eb1db9783e801d1b5#
    //detecet status code
    String data = response.body;
    if (response.statusCode == 200) {
      return data;
    } else {
      print(response.statusCode);
    }
  }
}
/*double temp = jsonDecode(data)['main']['temp'];
    print(temp);
    int id = jsonDecode(data)['weather'][0]['id'];
    print(id);
    String name = jsonDecode(data)['name'];
    print(name);*/