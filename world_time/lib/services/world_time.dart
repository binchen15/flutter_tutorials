import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location; // User friendly UI location name
  String url; // last piece of full url for the worltime api
  String flag; // string for access location flag icon
  String time; // current time in this region
  bool isDaytime; // show da/night-time background image based on it.

  // this.time is a derived quantity
  WorldTime({this.location, this.url, this.flag});

  Future<void> getTime() async {
    try {
      Response resp = await get("http://worldtimeapi.org/api/timezone/${url}");
      Map data = jsonDecode(resp.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      time = "could not get time data";
    }
  }
}
