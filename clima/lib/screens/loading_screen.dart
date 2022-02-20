import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:geolocator/geolocator.dart";
import '../services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var weatherData;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      weatherData = await WeatherModel().getLocationData();
      if (weatherData != null){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LocationScreen(
                    locationWeather: weatherData,
                  )));
      }
      
    } catch (e) {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  Color.fromARGB(255, 99, 22, 187),
                ],)),
      child: Scaffold(
        
        backgroundColor: Colors.transparent,
        body: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
// var condition = freshData["weather"][0]["id"];
// var temperature = freshData["main"]["temp"] - 273;
// var city = freshData["name"];