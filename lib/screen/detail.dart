import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../environment.dart';
import '../models/student.dart';

class Detail extends StatefulWidget {
  final Student student;

  Detail({this.student});

  @override
  DetailState createState() => DetailState();
}

class DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Student'),
      ),
      body: Container(
        height: 300,
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Name : ${widget.student.name}",
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Text(
              "Age : ${widget.student.age}",
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Text(
              "Email : ${widget.student.email}",
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Text(
              "Phone : ${widget.student.phone}",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
