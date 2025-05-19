import 'package:flutter/material.dart';
import 'package:weather/services/weather.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  LocationScreen({super.key, this.locationWeather});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temp;
  late int max;
  late int min;
  late double tempMax;
  late double tempMin;
  late String cityName;
  late String clear;
  @override
  void initState() {
    super.initState();
    print('here is the start of location screen state');
    UpdateUi(widget.locationWeather);
  }

  void UpdateUi(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        double temper = 0;
        temp = temper.toInt();

        tempMax = 0;
        max = tempMax.toInt();

        tempMin = 0;
        min = tempMin.toInt();
        cityName = 'error';
        clear = 'error';
        return;
      }

      double temper = weatherData['main']['temp'];
      temp = temper.toInt();

      tempMax = weatherData['main']['temp_max'];
      max = tempMax.toInt();

      tempMin = weatherData['main']['temp_min'];
      min = tempMin.toInt();
      cityName = weatherData['name'];
      clear = weatherData['weather'][0]['main'];
    });

    print(
        'temp ${temp - 273.toInt()} ==> max ${max - 273.toInt()} ==> min ${min - 273.toInt()} ${DateTime.now()} ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/1.jpeg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.7), BlendMode.dstATop))),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () async {
                        var weatherdata =
                            await WeatherModel().GetLocationWeather();
                        UpdateUi(weatherdata);
                      },
                      icon: Icon(Icons.near_me)),
                  IconButton(
                      onPressed: () async {
                        var typedWord = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }));
                        // var typedWord = Get.to(() => CityScreen());

                        if (typedWord != null) {
                          WeatherModel weather = WeatherModel();
                          var weatherData =
                              await weather.CityWeather(typedWord);
                          UpdateUi(weatherData);
                          //  print(' $typedWord passed to location screen & not null');
                        }
                      },
                      icon: Icon(Icons.location_city)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Temp ${temp - 273} ْ ',
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  Icon(Icons.sunny),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$cityName',
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
