import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name
  late String time;
  String flag; // url to image
  String url;
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      var res = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(res.body);
      // print(data);
      //get properties
      var datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime + " " + offset);

      // crate Datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);

      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      //set the time
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error $e');
      time = 'could not get time';
    }
    // make request
  }
}
