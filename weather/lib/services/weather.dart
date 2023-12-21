// ignore_for_file: avoid_print

import 'location.dart';
import 'network.dart';

const key = '72689e5d13f1617eb1db9783e801d1b5';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Network network =
        Network('$openWeatherMapUrl?q=$cityName&appid=$key&units=metric');
    var weatherData = await network.getData();
    return weatherData;
  }

  Future<dynamic> getLocation() async {
    Location location = Location();
    //wait getlocation fun finish .
    await location.getLocation();
    //latitude = location.latitude;
    //longitude = location.longitude;
    print(location.latitude);
    print(location.longitude);
    //&units=metric to temp selices.
    Network network = Network(
        '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$key&units=metric');

    final weatherData = await network.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
