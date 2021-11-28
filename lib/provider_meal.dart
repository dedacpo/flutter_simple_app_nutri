import 'package:http/http.dart' as http;

class Meals{

  final String _apiUrl = 'https://5d77ed9f1e31aa00149a39aa.mockapi.io/meal';

  getMeals() async{
    final response = await http.get(Uri.parse(_apiUrl)); 
  }
}