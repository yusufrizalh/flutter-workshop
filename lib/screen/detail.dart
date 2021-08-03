import 'package:flutter/material.dart';
import '../models/student.dart';
import './edit.dart';
import 'package:http/http.dart' as http;
import '../environment.dart';

class Detail extends StatefulWidget {
  final Student student;

  Detail({this.student});

  @override
  DetailState createState() => DetailState();
}

class DetailState extends State<Detail> {
  void deleteStudent(context) async {
    final url = '${Env.URL_PREFIX}/delete.php';
    await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
      body: {
        'id': widget.student.id.toString(),
      },
    );
    // Navigator.pop(context);
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  void confirmDelete(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Are you sure you want to delete this?'),
          actions: <Widget>[
            RaisedButton(
              child: Icon(Icons.cancel),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
            RaisedButton(
              child: Icon(Icons.check_circle),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => deleteStudent(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Student'),
        actions: <Widget>[
          IconButton(
            onPressed: () => confirmDelete(context),
            icon: Icon(Icons.delete),
          ),
        ],
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => Edit(student: widget.student),
          ),
        ),
      ),
    );
  }
}
