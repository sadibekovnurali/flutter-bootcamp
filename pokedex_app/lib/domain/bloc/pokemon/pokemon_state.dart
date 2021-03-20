part of 'pokemon_bloc.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadInProgress extends PokemonState {}

class PokemonLoadSuccess extends PokemonState {
  final List<PokemonListing> pokemonListing;
  final bool canLoadNextPage;

  PokemonLoadSuccess(
      {@required this.pokemonListing, @required this.canLoadNextPage});
}

class PokemonLoadFailed extends PokemonState {
  final Error error;

  PokemonLoadFailed({@required this.error});
}
