import 'dart:convert';
import 'package:http/http.dart' as http;

class PlacesService {
  static const String PLACES_API = 'YOUR_API_KEY';

  Future<String?> fetchPlaceImage(String placeQuery) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$placeQuery&inputtype=textquery&fields=name,photos&key=$PLACES_API');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (responseData['candidates'] != null && responseData['candidates'].isNotEmpty) {
        final photoReference = responseData['candidates'][0]['photos'][0]['photo_reference'];

        if (photoReference != null) {
          final imageURL = 'https://maps.googleapis.com/maps/api/place/photo?photoreference=$photoReference&key=$PLACES_API&maxwidth=1920&maxheight=1080';
          return imageURL;
        }
      }

      throw Exception('No photo found for the place.');
    } else {
      throw Exception('Failed to fetch place image. Status code: ${response.statusCode}');
    }
  }
}
