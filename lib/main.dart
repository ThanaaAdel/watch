import "dart:async";
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: watch(),
    );
  }
}

class watch extends StatefulWidget {
  const watch({Key? key}) : super(key: key);

  @override
  State<watch> createState() => _watchState();
}

class _watchState extends State<watch> {

  String weekday="";
  String date="";
  String timeNow="";

  Changeeverysec() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        weekday=DateFormat("EEEE").format(DateTime.now());
        date=DateFormat.yMMMd().format(DateTime.now());
        timeNow=DateFormat("hh:mm:ss a").format(DateTime.now());

      });
    });
  }

  @override
  void initState() {
    Changeeverysec();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Time & DateApp",
              style: TextStyle(
                  color: Colors.black, fontSize: 30, fontFamily: "myfont")),
          centerTitle: true,

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.message),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Today`s Date is $weekday",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontFamily: "myfont",
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                ),
              ),
              Text(
                timeNow,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                ),
              ),
            ],
          ),
        ));
  }
}
