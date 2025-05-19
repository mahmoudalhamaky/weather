import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String CityName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/1.jpeg'),
          fit: BoxFit.cover,
        )),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 50,
                  children: [
                    TextField(
                        onChanged: (value) {
                          CityName = value;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          //  hintText: 'enter city name',
                          label: Text('enter city name'),
                          hintStyle: TextStyle(color: Colors.grey),
                          icon: IconButton(
                            onPressed: () {
                              // print('$CityName');
                              Navigator.pop(
                                context,
                                CityName,
                              );
                              // print('your city is $CityName');
                            },
                            icon: Icon(Icons.location_city_rounded),
                            color: Colors.white,
                          ),
                        )),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          CityName,
                        );
                      },
                      icon: Icon(Icons.find_in_page),
                      color: Colors.white,
                      iconSize: 50,
                    )
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
