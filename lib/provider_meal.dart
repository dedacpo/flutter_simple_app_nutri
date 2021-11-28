import 'dart:convert';

import 'package:http/http.dart' as http;

import 'meal.dart';

class Meals{

  final String _apiUrl = 'https://5d77ed9f1e31aa00149a39aa.mockapi.io/meal';

  Future<List<Meal>> getMeals() async{
    final response = await http.get(Uri.parse(_apiUrl));
    return(json.decode(response.body) as List).map((e) => Meal.fromJson(e)).toList();
  }
}