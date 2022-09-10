import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'uk.png', endPoint: 'Europe/London'),
    WorldTime(
        location: 'Berlin', flag: 'greece.png', endPoint: 'Europe/berlin'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', endPoint: 'Africa/Cairo'),
    WorldTime(
        location: 'Nairobi', flag: 'kenya.png', endPoint: 'Africa/Nairobi'),
    WorldTime(
        location: 'Chicago', flag: 'usa.png', endPoint: 'America/Chicago'),
    WorldTime(
        location: 'New_York', flag: 'usa.png', endPoint: 'America/New_york'),
    WorldTime(
        location: 'Seoul', flag: 'south_korea.png', endPoint: 'Asia/Seoul'),
    WorldTime(
        location: 'Jarkata', flag: 'indonesia.png', endPoint: 'Asia/Jakarta'),
    WorldTime(location: 'Lagos', flag: 'ngn.png', endPoint: 'Afica/Lagos'),
    WorldTime(
        location: 'Johannesburg',
        flag: 'za.png',
        endPoint: 'Afica/Johannesburg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {},
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
        },
        itemCount: locations.length,
      ),
    );
  }
}
