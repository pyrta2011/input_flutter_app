import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              key: Key("formdata"),
              decoration:
                  InputDecoration(icon: Icon(Icons.person), labelText: 'Name'),
              validator: (String value) {
                if (value.contains('@')) {
                  return 'Do not use the @ char.';
                } else if (value.isEmpty) {
                  return 'Please, enter your name';
                }
              },
            ),
            TextFormField(
              key: Key("emailFormData"),
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: "email",
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return "Please, enter email";
                } else if (!value.contains('@')) {
                  return "Email, must contains '@'";
                }
              },
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Form load is success"),
                    backgroundColor: Colors.green,
                  ));
                }
              },
              child: Text("Validate form"),
            )
          ],
        ));
  }
}
