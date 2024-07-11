import "dart:convert";
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';


class ApiService{
  final String baseUrl="https://dog.ceo";
  List <Pokemon> lista = [];
  Future<List<Pokemon>> fetchPokemonList() async {
    final response = await http.get(Uri.parse('$baseUrl/api/breed/hound/images/random/25'));
    if(response.statusCode == 200){
      final data = json.decode(response.body);
      final List results = data['message'];
      for(int i=0; i< results.length;i++){
        Pokemon dato = Pokemon(url: results[i]);
        lista.add(dato);
      }
      return lista;
    }else{
      throw Exception('Failed Load result');
    }
  }
}
