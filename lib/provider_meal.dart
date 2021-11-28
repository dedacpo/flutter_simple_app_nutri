import 'dart:convert';

import 'package:http/http.dart' as http;

import 'meal.dart';

class Meals{

  final String _apiUrl = 'https://5d77ed9f1e31aa00149a39aa.mockapi.io/meal';

  Future<List<Meal>> getMeals() async{
    final response = await http.get(Uri.parse(_apiUrl));
    return(json.decode(response.body) as List).map((e) => Meal.fromJson(e)).toList();
  }

  Future<Meal> postMeal(Map<String, dynamic> meal) async {
    final response = await http.post(
      Uri.parse(_apiUrl),
      body: json.encode(meal),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return Meal.fromJson(json.decode(response.body));
  }
}