import 'package:flutter/material.dart';
import './screens/login.dart';
import './screens/register.dart';
import './screens/dashboard.dart';
import './screens/addevent.dart';
import './screens/eventdetails.dart';
import './screens/attendences.dart';

void main() {
  runApp(AttendanceTrackerApp());
}

class AttendanceTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/addevent': (context) => AddEventScreen(), 
        '/event-details': (context) => EventDetailsScreen(),
        '/reports': (context) => ReportsScreen(),
      },
    );
  }
}
