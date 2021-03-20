part of 'pokemon_bloc.dart';

abstract class PokemonEvent {}

class PokemonRequest extends PokemonEvent {
  final int page;

  PokemonRequest({@required this.page});
}
