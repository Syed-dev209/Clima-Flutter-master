import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/screens/Location_getting.dart';
const apikey='032a383266f52f8e744ba2eceecf2e81';
class WeatherModel {


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

  Future<dynamic> locationWeather() async
  {
    GiveMeLocation loc = GiveMeLocation();
    await loc.currentLocation();

    NetworkHelper net = NetworkHelper(address:'https://api.openweathermap.org/data/2.5/weather?lat=${loc.lat}&lon=${loc.lang}&appid=$apikey&units=metric');
    var weatherData= await net.getData();
    return weatherData;
  }

  Future<dynamic> cityWeather(String cityName) async
  {
    NetworkHelper net = NetworkHelper(address:'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric');
    var weatherData= await net.getData();
    return weatherData;
  }


}
