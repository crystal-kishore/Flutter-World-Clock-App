import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> locations = [
    WorldTime(url: 'Pacific/Auckland', location: 'Auckland', flag: 'newzealand.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'uae.png'),
    WorldTime(url: 'Asia/Hong_Kong', location: 'Hong Kong', flag: 'hongkong.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Luxembourg', location: 'Luxembourg', flag: 'luxembourg.png'),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'spain.png'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'russia.png'),
    WorldTime(url: 'America/Mexico_City', location: 'Mexico City', flag: 'mexico.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'france.png'),
    WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'italy.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Sivaganga', flag: 'india.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'canada.png'),

  ];
   void updateTime(index) async{
     WorldTime obj = locations[index];
     await obj.getTime();
     Navigator.pop(context,{
       'location' : obj.location,
       'time' : obj.time,
       'flag' : obj.flag,
       'date' : obj.date,
       'isDaytime' : obj.isDaytime,
     });
   }

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                     backgroundImage: AssetImage('assets/${locations[index].flag}'),
                    ),
                ),
              ),
            );
          }
      ),
      persistentFooterButtons: const [
        Center(
        child: Text('© Developed by Crystal Kishore', style: TextStyle(
          color: Colors.grey,
          fontSize: 10.0,
          fontWeight: FontWeight.bold,
        ),
        ),
        ),
      ],

    );
  }
}
