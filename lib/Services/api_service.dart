import 'dart:convert';
import '../Model/search_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<SearchInternshipModel> searchInternships() async {
    try {
      final response = await http.get(
          Uri.parse('https://internshala.com/flutter_hiring/search'),
      );

      if (response.statusCode == 200) {
        print('Success: Fetched Internships');
        return SearchInternshipModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        // Log the response for debugging
        print('Failed to load Internships. Status code: ${response.statusCode}');
        throw Exception('Failed to load Internships: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e'); // Log the error
      throw Exception('An error occurred while fetching internships: $e');
    }
  }
}
