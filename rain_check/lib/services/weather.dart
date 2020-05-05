import 'package:raincheck/services/networking.dart';
import 'location.dart';

const apiKey = 'dd406daf34c2b63ba7ff80d62ea13d83';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        url: '$openWeatherURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();

    await location
        .getCurrentLocation(); //   From this point build is running while await!

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric'); // &units=metric added to get metric temp aka temp in celsius and not in kelvin
    //  ${location.latitude}

    //  The moment api build is done
    var weather = await networkHelper
        .getData(); // Now variable weather has the response.body // NOTE: await keyword here is very important!

    return weather;
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
