import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../environment.dart';
import '../models/student.dart';
import 'detail.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<List<Student>> students;
  final studentKeyList = GlobalKey<HomeState>();

  @override
  void initState() {
    super.initState();
    students = getStudentList();
  }

  Future<List<Student>> getStudentList() async {
    // final url = '${Env.URL_PREFIX}/json-data/json-data.json';
    final url = '${Env.URL_PREFIX}/list.php';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    );
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Student> students = items.map<Student>((json) {
      return Student.fromJson(json);
    }).toList();

    return students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: studentKeyList,
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: Center(
        child: FutureBuilder<List<Student>>(
          future: students,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.view_list),
                    title: Text(
                      data.name,
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detail(student: data)),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
