import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  @override
  State<LoadingScreen> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  SpinKitRotatingCircle spinkit = SpinKitRotatingCircle(
    color: Colors.deepPurple,
    size: 50.0,
  );
  SpinKitFadingCircle spinkit2 = SpinKitFadingCircle(
    color: Colors.deepPurple,
    size: 50.0,
  );

  Future<void> GetLocationData() async {
    weatherData = await WeatherModel().GetLocationWeather();
  }

  // void move (){ Get.to(()=>LocationScreen(locationWeather: weather,));}

  // @override
  // void initState(){
  //   super.initState();
  //
  //   print('init state triggered');
  // }

  @override
  Widget build(BuildContext context) {
    GetLocationData();
    print('the build methode has been triggered ');
    return Scaffold(
      body: Center(
          child: SafeArea(
              child: GestureDetector(
        onTap: () {},
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                // Get.snackbar('Me', 'message');
                //Get.defaultDialog(title: 'how',);
                try {
                  //print('$long and $lat');
                  //print('$weather');
                  Get.to(() => LocationScreen(
                        locationWeather: weatherData,
                      ));
                } catch (e) {
                  print('$e');
                }
              },
              icon: Icon(
                Icons.location_on,
              ),
              iconSize: 50,
            ),
            Text(
              'Get Location',
              style: TextStyle(fontSize: 25),
            ),
            // spinkit2,
          ],
        ),
      ))),
    );
  }
}

// double temp = jsonDecode(data)['main']['temp'];
// double tempMax =  jsonDecode(data)['main']['temp_max'];
// double tempMin =  jsonDecode(data)['main']['temp_min'];
// String cityName = jsonDecode(data)['name'];
// String clear = jsonDecode(data)['weather'][0]['main'];
// print('$fullData');
// //print('temp = $temp , Max Temp = $tempMax and Min Temp =$tempMin also city is $cityName sseem to be $clear');
