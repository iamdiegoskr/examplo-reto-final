import 'package:consumo_api_app/models/comics_response.dart';
import 'package:http/http.dart' as http;

Future<List<Comic>> apiComics() async {
  String baseUrl = 'gateway.marvel.com';
  String endPoint = 'v1/public/comics';

  String ts = '1000';
  String apikey = 'ae1d2b5c0b8d73ae295e212eaae5090e';
  String hash = '37cc53d68c7a8f77840938de7732730e';

  var url = Uri.https(baseUrl, endPoint, {
    'ts': ts,
    'apikey': apikey,
    'hash': hash,
  });

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final responseComics = responseComicsFromMap(response.body);
    final results = responseComics.data.results;
    return results;
  } else {
    throw Exception("Error al obtener la lista de comics");
  }
}
