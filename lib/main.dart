import 'package:flutter/material.dart';
import 'package:form_validation/formScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.0
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: FormScreen(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        TextFormField(
          validator: (value) {
            if (value == null) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Processing data')));
            }
          },
          child: Text('Submit'),
        ),
      ]),
    );
  }
}
