import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading ({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time ='loading';

  void setupWorldTime() async {
    WorldTime obj = WorldTime(location: 'Sivaganga', flag: 'India.png', url: 'Asia/Kolkata');
    await obj.getTime();
    Navigator.pushReplacementNamed(context,'/home', arguments:
    {
      'location':obj.location,
      'flag':obj.flag,
      'time': obj.time,
      'date': obj.date,
      'isDaytime': obj.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: SpinKitPouringHourGlass(
            color: Colors.white,
            size: 90.0,
          ),
      ),
    );
  }
}
