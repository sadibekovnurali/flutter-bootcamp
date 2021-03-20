import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/display/pages/home.dart';
import 'package:pokedex_app/domain/bloc/pokemon/pokemon_bloc.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonBloc>(
          create: (context) => PokemonBloc()..add(PokemonRequest(page: 0)),
        ),
      ],
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
