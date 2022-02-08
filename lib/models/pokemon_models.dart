// count:1118
// next:"https://pokeapi.co/api/v2/pokemon?offset=100&limit=100"
// previous:null
// name:"bulbasaur"
// url:"https://pokeapi.co/api/v2/pokemon/1/"

class PokemonListResponse {
  final int id;
  final String name;
  final String imageUrl;

  PokemonListResponse(
      {required this.id, required this.name, required this.imageUrl});

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) {
    final String url = json['url'];

    final int id = int.parse(url.split('/')[6]);
    final String name = json['name'];
    final String imageUrl =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
    return PokemonListResponse(id: id, name: name, imageUrl: imageUrl);
  }
}

class PokemonPageResponse {
  final bool hasNextPage;
  final List<PokemonListResponse> result;

  PokemonPageResponse({
    required this.hasNextPage,
    required this.result,
  });

  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    final hasNextPage = json['next'] == null;
    final result = (json['results'] as List)
        .map((listingJson) => PokemonListResponse.fromJson(listingJson))
        .toList();

    return PokemonPageResponse(hasNextPage: hasNextPage, result: result);
  }
}
