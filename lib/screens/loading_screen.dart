import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocation();
    super.initState();
  }
  void getLocation() async {
    Location loc= Location();
    try {
      await loc.getLocation();
      print(loc.latitude);
      print(loc.longitude);
    }
    catch(e){
      print(e);
    }
  }


  Future<void> getData() async {
    http.Response response= await http.get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
    if(response.statusCode==200) {
      String data=response.body;
      print(jsonDecode(data)['coord']['lon']);

    }
    else
      print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
