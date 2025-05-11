import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

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
  late var weather;
  static const String apiKey = '5756d6ea14023a2485674d1d7751faff#';

  Future<void> GetLocationData() async {
    Location myLocation = Location();

    await myLocation.CurrentLocation();

    NetworkHelper netwokHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${myLocation.lat}&lon=${myLocation.long}&appid=$apiKey&units=metric');
    weather = await netwokHelper.GetData();

    print('${myLocation.timeNow}');
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
                        locationWeather: weather,
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
