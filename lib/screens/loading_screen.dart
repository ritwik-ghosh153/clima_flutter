import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey='be033c67b361974b883b0a0fb9d924d4';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double _latitude;
  double _longtude;

  @override
  void initState() {
    getLocation();
    super.initState();
  }

void getLocationdata()async{
  Location loc= Location();
  await loc.getLocation();
  _latitude=loc.latitude;
  _longtude=loc.longitude;

    NetworkHelper networkHelper=NetworkHelper(url:'https://api.openweathermap.org/data/2.5/weather?lat=$_latitude&lon=$_longtude&appid=$apiKey');
    var weather=await getData();
    String city=weather[]

}



  Future<void> getData() async {
    http.Response response= await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$_latitude&lon=$_longtude&appid=$apiKey');
    if(response.statusCode==200) {
      String data=response.body;
      String description=jsonDecode(data)['weather'][0]['description'];
      double temp=jsonDecode(data)['main']['temp'];
      String city=jsonDecode(data)['name'];
      print(description);
      print(temp);
      print(city);
    }
    else
      print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
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
