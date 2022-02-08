import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon_models.dart';

class PokemonService {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonList(int pageIndex) async {
    final offset = pageIndex * 200;
    final queryParametres = {'limit': '200', 'offset': offset.toString()};
    try {
      final uri = Uri.https(baseUrl, 'api/v2/pokemon', queryParametres);

      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      return PokemonPageResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
