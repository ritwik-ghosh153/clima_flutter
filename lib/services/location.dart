import 'package:geolocator/geolocator.dart';

class Location{

  double _latitude;
  double _longitude;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _latitude= position.latitude;
      _longitude= position.longitude;
    }
    catch(e){
      _latitude=0.0;
      _longitude=0.0;

    }
  }

  double get latitude => _latitude;
  double get longitude => _longitude;
}