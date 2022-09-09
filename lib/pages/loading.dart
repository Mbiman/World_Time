// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    //make the request
    String url = 'http://worldtimeapi.org/api/timezone/Africa/Johannesburg';
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    //print(data);

    //get properties from the data
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].toString().substring(1, 3);

    // print(dateTime);
    // print(offset);

    //create a dateTime object

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        'Loading screen',
      ),
    );
  }
}
