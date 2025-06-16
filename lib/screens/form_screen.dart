import 'package:campus_gateway/screens/result_screen.dart';
import 'package:flutter/material.dart';
// import 'results_screen.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _grades = '';
  String _fieldOfInterest = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'High School Grades'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your grades';
                  }
                  return null;
                },
                onSaved: (value) {
                  _grades = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Field of Interest'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your field of interest';
                  }
                  return null;
                },
                onSaved: (value) {
                  _fieldOfInterest = value!;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsScreen(
                          grades: _grades,
                          fieldOfInterest: _fieldOfInterest,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
