import 'package:flutter/material.dart';

class AppForm extends StatefulWidget {
  // Required for form validations
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Handles text onchange
  TextEditingController nameController;
  TextEditingController ageController;
  AppForm({this.formKey, this.nameController, this.ageController});

  @override
  AppFormState createState() => AppFormState();
}

class AppFormState extends State<AppForm> {
  String validateName(String value) {
    if (value.length < 3) return 'Nama harus lebih dari 2 karakter';
    return null;
  }

  String validateAge(String value) {
    Pattern pattern = r'(?<=\s|^)\d+(?=\s|$)';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) return 'Usia harus diisi dengan angka';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Name'),
            validator: validateName,
          ),
          TextFormField(
            controller: widget.ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Age'),
            validator: validateAge,
          ),
        ],
      ),
    );
    ;
  }
}
