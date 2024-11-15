import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';

  @override
  void initState() {
    super.initState();
    getPosition().then((Position myPos) {
      myPosition =
          'Latitude: ${myPos.latitude.toString()} - Longitude: ${myPos.longitude.toString()}';
      setState(() {
        myPosition = myPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final MyWidget = myPosition == ''
        ? const CircularProgressIndicator()
        : Text(myPosition);
    
    return Scaffold(
      appBar: AppBar(title: Text('Current Location Yoga')),
      body: Center(child: MyWidget),
    );
  }

  Future<Position> getPosition() async {
  await Future.delayed(const Duration(seconds: 3)); // Menambahkan delay selama 3 detik
  await Geolocator.requestPermission();
  await Geolocator.isLocationServiceEnabled();
  Position position = await Geolocator.getCurrentPosition();

  return position;
}

}
