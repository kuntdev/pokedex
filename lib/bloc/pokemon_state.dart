part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class Initial extends PokemonState {}

class Loading extends PokemonState {}

class Loaded extends PokemonState {
  final List<PokemonListResponse> pokemonList;
  final bool hasNextPage;

  Loaded({
    required this.pokemonList,
    required this.hasNextPage,
  });
}

class Failed extends PokemonState {
  final Error error;

  Failed({required this.error});
}
