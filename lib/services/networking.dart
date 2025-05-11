import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NetworkHelper {
  SpinKitFadingCircle spinkit2 = SpinKitFadingCircle(color: Colors.deepPurple, size: 50.0,);
  final String url;
  NetworkHelper(this.url);

  Future GetData()async{
    final response = await https.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
       var  fullData= jsonDecode(data);
       return fullData;

    } else {
      // Error handling
      print('Request failed with status: ${response.statusCode}');
    }
  }

  @override
 Widget build (BuildContext context){
    return Scaffold(
      body: Center(
        child:spinkit2 ,
      ),
    );
  }


}