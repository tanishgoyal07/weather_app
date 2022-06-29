// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, depend_on_referenced_packages, unused_import, deprecated_member_use, unused_local_variable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http ;
import 'dart:convert';

void main() => runApp
(
  MaterialApp(
    title: "Weather App",
    home: Home(),
  )//Material App
);

class Home extends StatefulWidget{ 
   @override
   State<StatefulWidget> createState (){
    return _HomeState();
   }
}

class _HomeState extends State<Home> {

  var temp;
  var feelslike;
  var description;
  var currently;
  var humididty;
  var windSpeed;
  var pressure;

  Future getWeather() async{
    String url = "https://api.openweathermap.org/data/2.5/weather?lat=28.5921&lon=76.2653&units=metric&appid=6ad8c420427a6fdcaa9610a8f8ab69cf";
    http.Response response = await http.get(Uri.parse(url));
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.feelslike = results['main']['feels_like'];
      this.pressure = results['main']['pressure'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humididty = results['main']['humididty'];
      this.windSpeed = results['wind']['speed'];
    });
  }

  @override
  void initState()
  {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.purple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Currently in Charkhi Dadri",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900
                    ),
                  ),
                ), 
                Text(
                  temp != null ? temp.toString() + "\u00B0" : "Loading",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    currently != null ? currently.toString() : "Loading",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900
                    ),
                  ),
                ),
              ]
            ),
          ),
          Expanded(
            child:  Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                    title: Text("Temperature"),
                    trailing: Text(temp != null ? temp.toString() + "\u00B0" : "Loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                    title: Text("Feels Like"),
                    trailing: Text(feelslike != null ? feelslike.toString() + "\u00B0" : "Loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.cloud),
                    title: Text("Weather"),
                    trailing: Text(description != null ? description.toString() : "Loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text("Humididty"),
                    trailing: Text(humididty != null ? humididty.toString() : "Loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.wind),
                    title: Text("Wind Speed"),
                    trailing: Text(windSpeed != null ? windSpeed.toString() : "Loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.prescriptionBottle),
                    title: Text("Pressure"),
                    trailing: Text(pressure != null ? pressure.toString() : "Loading"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

 
