import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/screens/loading_screen.dart';

class LocationScreen extends StatefulWidget {
   final locationWeather ;
   LocationScreen({super.key, this.locationWeather});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temp;
  late double tempMax ;
  late double tempMin ;
  late String cityName ;
  late String clear ;
  @override
  void initState() {
  super.initState();
    print('here is the start of location screen state');
  UpdateUi(widget.locationWeather);
  }

  void UpdateUi (dynamic weatherData){

    double temper = weatherData['main']['temp'];
    temp =   temper.toInt();
    tempMax =  weatherData['main']['temp_max'];
    tempMin =  weatherData['main']['temp_min'];
    cityName = weatherData['name'];
    clear =    weatherData['weather'][0]['main'];
    print('${temp-273.toInt() } and $tempMax and $tempMin');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/1.jpeg'),
          fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.dstATop)
          )

        ),

        child: SafeArea(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                            IconButton(onPressed: (){Get.to(()=>LoadingScreen());}, icon: Icon(Icons.add)),
                            IconButton(onPressed: (){}, icon: Icon(Icons.minimize)),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text('Temp ${temp-273} ْ ',style: TextStyle(  color: Colors.white,fontSize: 50),),
                  Icon(Icons.sunny),
            ],),),

            Padding(padding: EdgeInsets.all(20),
              child: Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text('$cityName',style: TextStyle( color: Colors.white,fontSize: 50),),

            ],),),
          ],
        )
        ),
      ),
    );
  }


}