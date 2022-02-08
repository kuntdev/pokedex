import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/models/pokemon_models.dart';
import 'package:pokedex/services/pokemon_service.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final pokemonService = PokemonService();
  PokemonBloc() : super(Initial()) {
    on<PokemonPageRequest>(_onPageRequest);
  }

  void _onPageRequest(
      PokemonPageRequest event, Emitter<PokemonState> emit) async {
    emit(Loading());
    try {
      final response = await pokemonService.getPokemonList(event.page);
      emit(Loaded(
          pokemonList: response.result, hasNextPage: response.hasNextPage));
    } catch (e) {
      Failed(error: e as Error);
    }
  }
}
