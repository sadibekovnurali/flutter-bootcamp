import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex_app/domain/models/pokemon_model.dart';
import 'package:pokedex_app/domain/repositories/pokemon_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepository = PokemonRepository();

  PokemonBloc() : super(PokemonInitial());

  @override
  Stream<PokemonState> mapEventToState(
    PokemonEvent event,
  ) async* {
    if (event is PokemonRequest) {
      yield PokemonLoadInProgress();

      try {
        final pokemonResponse = await _pokemonRepository.getPokemon(event.page);
        yield PokemonLoadSuccess(
          pokemonListing: pokemonResponse.pokemonListing,
          canLoadNextPage: pokemonResponse.canLoadNextPage,
        );
      } catch (e) {
        yield PokemonLoadFailed(error: e);
      }
    }
  }
}
