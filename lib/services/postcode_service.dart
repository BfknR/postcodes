// lib/services/postcode_service.dart
import 'package:http/http.dart';
import 'package:postcodes/models/postcodes_response.dart';

import '../models/place.dart';

class PostcodeService {
  final baseUrl = 'https://geocoding-api.open-meteo.com/v1';

  Future<String> getBody(String path) async { 
    final Response response = await get(Uri.parse('$baseUrl/$path'));
    if(response.statusCode != 200){
      throw Exception('Error ${response.statusCode}');
    }
    return response.body;
  }

  Future<List<Place>> search(String query) async {
    final body = await getBody('search?name=$query&language=ca&countryCode=ES');
    return postcodesResponseFromJson(body).results;
  }
}