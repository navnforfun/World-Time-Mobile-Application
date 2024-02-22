import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ex4_worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:source_span/source_span.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading';

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: "HCM", flag: 'vi', url: 'Asia/Ho_Chi_Minh');
    await instance.getTime();
    Map x = {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDaytime
    };
    print(x);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDaytime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setupWorldTime();

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Center(
          child: SpinKitCircle(
            color:Colors.white,
            size: 80,
          ),
        ),
      ),
    );
  }
}
