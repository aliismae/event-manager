import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: ListView.builder(
        itemCount: 10, // Replace with dynamic data later
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Event ${index + 1}'),
            subtitle: Text('Event Details'),
            onTap: () {
              Navigator.pushNamed(context, '/event-details');
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addevent');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
