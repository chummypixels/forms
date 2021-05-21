import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late String _name;
  late String _email;
  late String _password;
  late String _url;
  late String _phoneNumber;
  late int _calories;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Name is required';
        }
        return null;
      },
      onSaved: (value) {
        _name = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return ('Please enter a valid email Address');
        }
        return null;
      },
      onSaved: (value) {
        _email = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        return null;
      },
      onSaved: (value) {
        _password = value!;
      },
    );
  }

  Widget _buildUrl() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Url'),
      keyboardType: TextInputType.url,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Url is required';
        }
        return null;
      },
      onSaved: (value) {
        _url = value!;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone Number'),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Phone number is required';
        }
        return null;
      },
      onSaved: (value) {
        _phoneNumber = value!;
      },
    );
  }

  Widget _buildCalories() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Calories'),
      keyboardType: TextInputType.number,
      validator: (value) {
        int? calories = int.tryParse(value!);
        if (_calories == null || _calories <= 0) {
          return 'Calories must be greater than 0';
        }
        return null;
      },
      onSaved: (value) {
        _password = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Demo'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              _buildEmail(),
              _buildPassword(),
              _buildPhoneNumber(),
              _buildCalories(),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    _formKey.currentState!.save();
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
