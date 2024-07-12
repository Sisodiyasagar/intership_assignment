import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name, _email, _phone, _gender, _country, _state, _city;

  final List<String> _genders = ['Male', 'Female', 'Other'];
  final List<String> _countries = ['USA', 'Canada', 'India'];
  final List<String> _states = ['California', 'Texas', 'New York'];
  final List<String> _cities = ['Los Angeles', 'Houston', 'New York City'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTextField(
                label: 'Name',
                onSaved: (value) => _name = value,
                validator: (value) => value!.isEmpty ? 'Name is required' : null,
              ),
              _buildTextField(
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => _email = value,
                validator: (value) =>
                value!.isEmpty ? 'Email is required' : null,
              ),
              _buildTextField(
                label: 'Phone',
                keyboardType: TextInputType.phone,
                onSaved: (value) => _phone = value,
                validator: (value) =>
                value!.isEmpty ? 'Phone number is required' : null,
              ),
              _buildDropdownField(
                label: 'Gender',
                value: _gender,
                items: _genders,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
              _buildDropdownField(
                label: 'Country',
                value: _country,
                items: _countries,
                onChanged: (value) {
                  setState(() {
                    _country = value;
                  });
                },
              ),
              _buildDropdownField(
                label: 'State',
                value: _state,
                items: _states,
                onChanged: (value) {
                  setState(() {
                    _state = value;
                  });
                },
              ),
              _buildDropdownField(
                label: 'City',
                value: _city,
                items: _cities,
                onChanged: (value) {
                  setState(() {
                    _city = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    TextInputType keyboardType = TextInputType.text,
    required FormFieldSetter<String> onSaved,
    required FormFieldValidator<String> validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        value: value,
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        validator: (value) => value == null ? '$label is required' : null,
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Process data here (e.g., send to server)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully')),
      );
    }
  }
}
