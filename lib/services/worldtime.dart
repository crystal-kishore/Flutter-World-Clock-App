import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time='';
  String date='';
  String flag;
  String url;
  bool isDaytime=false;

  WorldTime({ required this.location, required this.flag,required this.url});

  Future <void> getTime() async{

    try {
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);


      // get datetime properties from API
      String datetime = data['datetime'];
      String offset1 = data['utc_offset'].substring(0, 3);
      String offset2 = data['utc_offset'].substring(4);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset1),minutes: int.parse(offset2)));

      isDaytime = now.hour > 6 && now.hour < 19 ? true :false;
      time = DateFormat.jm().format(now);
      date = DateFormat.yMMMMEEEEd().format(now);
    }
    catch (e){
      time = 'External Server Error';
      date = 'Beyond Time';
    }


  }

}