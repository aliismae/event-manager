import 'package:flutter/material.dart';
import '../api/auth_service.dart';

class AddEventScreen extends StatelessWidget {
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _eventDateController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _eventNameController,
              decoration: InputDecoration(labelText: 'Event Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _eventDateController,
              decoration: InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
          
                if (_eventNameController.text.isEmpty ||
                    _eventDateController.text.isEmpty ||
                    _locationController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('All fields are required!')),
                  );
                  return;
                }
                try {
                  final userId = 1; 
                  await _authService.createEvent(
                    _eventNameController.text,
                    _eventDateController.text,
                    _locationController.text,
                    userId,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Event created successfully!')),
                  );

                
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to create event: $e')),
                  );
                }
              },
              child: Text('Save Event'),
            ),
          ],
        ),
      ),
    );
  }
}
