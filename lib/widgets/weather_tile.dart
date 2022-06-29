// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, invalid_required_positional_param, must_be_immutable

import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget{
  IconData icon;
  String title;
  String subtitle;

  WeatherTile(@required this.icon, @required this.title, @required this.subtitle);

  @override
  Widget build (BuildContext context){
    return  ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color : Colors.purple,)
        ],
      ),
      title: Text(
        title,
         style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Color(0xff9e9e9e)
        ),
      ),
    );
  }

}