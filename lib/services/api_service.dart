import "dart:convert";
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';
import 'dart:developer';


class ApiService{
  final String baseUrl="https://dog.ceo";

  Future<List<Pokemon>> fetchPokemonList() async {
    final response = await http.get(Uri.parse('$baseUrl/api/breed/hound/images/random/10'));
    log(response.body.toString());

    if(response.statusCode == 200){
      final data = json.decode(response.body);
      final List results = data['message'];
      log(data);
      log("entro");
      return results.map((e)=>Pokemon.fromJson(e)).toList();
    }else{
      throw Exception('Failed Load result');
    }
  }
}