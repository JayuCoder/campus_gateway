import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final String grades;
  final String fieldOfInterest;

  const ResultsScreen({required this.grades, required this.fieldOfInterest});

  @override
  Widget build(BuildContext context) {
    // This is where you would fetch and display the results based on the grades and field of interest.
    // For simplicity, we'll just show a placeholder list.

    List<String> availableColleges = [
      'College A',
      'College B',
      'College C',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Colleges'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Grades: $grades',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Field of Interest: $fieldOfInterest',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Available Colleges:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: availableColleges.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(availableColleges[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
