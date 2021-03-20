import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/domain/models/pokemon_model.dart';

class PokemonRepository {
  final _url = 'pokeapi.co';
  final _client = http.Client();

  Future<PokemonResponse> getPokemon(int pageIndex) async {
    final queryParameters = {
      'limit': '200',
      'offset': (pageIndex * 200).toString(),
    };

    final uri = Uri.https(_url, '/api/v2/pokemon', queryParameters);

    final response = await _client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonResponse.fromJson(json);
  }
}