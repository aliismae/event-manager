import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event Details')),
      body: ListView.builder(
        itemCount: 10, // Replace with dynamic data later
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Attendee ${index + 1}'),
            subtitle: Text('Status: Absent'),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                // Update attendance status
              },
              itemBuilder: (context) => [
                PopupMenuItem(value: 'Present', child: Text('Present')),
                PopupMenuItem(value: 'Absent', child: Text('Absent')),
                PopupMenuItem(value: 'Late', child: Text('Late')),
                PopupMenuItem(value: 'Excused', child: Text('Excused')),
              ],
            ),
          );
        },
      ),
    );
  }
}
