import 'package:flutter/material.dart';
import 'package:raincheck/screens/city_screen.dart';
import 'package:raincheck/utilities/constants.dart';
import 'package:raincheck/services/weather.dart';

WeatherModel weatherModel = WeatherModel();

class LocationScreen extends StatefulWidget {
  final locationWeather;

  LocationScreen(
      {this.locationWeather}); //now the weather is passed to the loading screen!
  //It is a state widget

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String weatherIcon;
  var temp;
  String tempMessage;
  String cityName;

  String message;

  @override
  void initState() {
    super.initState();
//    print(widget.locationWeather);
//        A [State] object's configuration is the corresponding [StatefulWidget] instance.
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temp = 0;
        weatherIcon = '';
        message = 'Error';

        return; //  IMPORTANT! Here an empty return sign is written to tell the code to stop here not not execute forward, else our app will crash!

      }
      var condition = weatherData['weather'][0]['id'];
      print(condition);

      weatherIcon = weatherModel.getWeatherIcon(condition);
      print(weatherIcon);

      cityName = weatherData['name'];

      temp = weatherData['main']['temp'];
      tempMessage = weatherModel.getMessage(temp.toInt());

      message = '$tempMessage in $cityName!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/location_background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
            constraints: BoxConstraints.expand(),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () async {
                          var weatherData = await weatherModel.getWeatherData();
                          updateUI(weatherData);
                        },
                        child: Icon(
                          Icons.near_me,
                          size: 50.0,
                        ),
                      ),
                      FlatButton(
                        onPressed: () async {
                          var cityName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CityScreen(),
                            ),
                          );

                          if (cityName != null) {
                            var weatherData =
                                await weatherModel.getCityWeather(cityName);

                            updateUI(weatherData);
                          }
                        },
                        child: Icon(
                          Icons.location_city,
                          size: 50.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '${temp.toInt()}°',
                          style: kTempTextStyle,
                        ),
                        Text(
                          weatherIcon,
                          style: kConditionTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      '$message',
                      textAlign: TextAlign.right,
                      style: kMessageTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
