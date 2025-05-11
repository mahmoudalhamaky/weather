import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/1.jpeg'), fit: BoxFit.cover,opacity: .9)

        ),

        constraints: BoxConstraints.expand(),

        child: SafeArea(child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
            child: Column(
              children: [
                IconButton(onPressed: (){},
                  icon: Icon(Icons.location_city_rounded),color: Colors.white,),
                IconButton(onPressed: (){},
                  icon: Icon(Icons.location_city_rounded),color: Colors.white,),
                IconButton(onPressed: (){},
                  icon: Icon(Icons.location_city_rounded),color: Colors.white,),
              ],
            ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: null,
            )

          ],
        )
        ),
      ),
    );
  }
}
