import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; //location name for the UI
  late String time; //time in the location
  late String flag; //url to an asset flag icon
  late String endPoint; //location url for api endpoint
  late bool isDayTime; //true or false if daytime or not

  WorldTime(
      {required this.location, required this.flag, required this.endPoint});

  Future<void> getTime() async {
    try {
      //make the request
      String url = 'http://worldtimeapi.org/api/timezone/$endPoint';
      Response response = await get(Uri.parse(url));
      Map data = jsonDecode(response.body);

      //get properties from the data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].toString().substring(1, 3);

      //create a dateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error : $e');
      time = 'could not get time data';
    }
  }
}
