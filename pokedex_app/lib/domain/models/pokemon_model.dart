import 'package:flutter/material.dart';

class PokemonListing {
  final int id;
  final String name;

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  PokemonListing({@required this.id, @required this.name});

  factory PokemonListing.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'];
    final id = int.parse(url.split('/')[6]);

    return PokemonListing(id: id, name: name);
  }
}

class PokemonResponse {
  final List<PokemonListing> pokemonListing;
  final bool canLoadNextPage;

  PokemonResponse(
      {@required this.pokemonListing, @required this.canLoadNextPage});

  factory PokemonResponse.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != 0;
    final pokemonListing = (json['results'] as List)
        .map((listingJson) => PokemonListing.fromJson(listingJson))
        .toList();

    return PokemonResponse(
        pokemonListing: pokemonListing, canLoadNextPage: canLoadNextPage);
  }
}
