import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../environment.dart';
import '../widgets/form.dart';

class Create extends StatefulWidget {
  final Function refreshStudentList;
  Create({this.refreshStudentList});

  @override
  CreateState createState() => CreateState();
}

class CreateState extends State<Create> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();

  Future createStudent() async {
    final url = '${Env.URL_PREFIX}/create.php';
    return await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
      body: {
        "name": nameController.text,
        "age": ageController.text,
      },
    );
  }

  void onConfirm(context) async {
    await createStudent();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: RaisedButton(
          child: Text("CONFIRM"),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            if (formKey.currentState.validate()) {
              onConfirm(context);
            }
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: AppForm(
              formKey: formKey,
              nameController: nameController,
              ageController: ageController,
            ),
          ),
        ),
      ),
    );
  }
}
