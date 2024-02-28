import 'dart:convert';

import 'package:geoking/features/game/models/country.dart';
import 'package:http/http.dart' as http;

class GameRepository {
  Future<List<Country>> fetchCountries() async {
    final uri = Uri.parse('https://restcountries.com/v3.1/all?fields=name,latlng');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final countries = jsonDecode(response.body) as List;
      return countries.map((country) => Country.fromJson(country)).toList();
    } else {
      throw Exception('Unable to retrieve countries list');
    }
  }
}
