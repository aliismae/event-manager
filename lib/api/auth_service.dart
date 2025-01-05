import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_config.dart';

class AuthService {
  // Register a new user
  Future<void> registerUser(String name, String email, String password) async {
    final url = Uri.parse('${baseUrl}auth/register.php');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['error'] != null) {
          throw Exception('Registration failed: ${data['error']}');
        } else {
          print('Registration successful: ${data['message']}');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to register user');
    }
  }

  // Login a user
  Future<void> loginUser(String email, String password) async {
    final url = Uri.parse('${baseUrl}auth/login.php');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['error'] != null) {
          throw Exception('Login failed: ${data['error']}');
        } else {
          print('Login successful: ${data['message']}');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to login user');
    }
  }

  // Add a new event
  Future<void> createEvent(String eventName, String eventDate, String location, int userId) async {
    final url = Uri.parse('${baseUrl}events/create_event.php');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'event_name': eventName,
          'event_date': eventDate,
          'location': location,
          'user_id': userId,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['error'] != null) {
          throw Exception('Failed to create event: ${data['error']}');
        } else {
          print('Event created successfully: ${data['message']}');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to create event');
    }
  }
}
