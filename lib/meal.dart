import 'package:flutter/material.dart';

class Meal {
  final String title;
  final String imgUrl;
  final String description;
  final int kcal;
  final int carbs;
  final int prot;

  const Meal({
    required this.title,
    required this.imgUrl,
    required this.description,
    required this.kcal,
    required this.carbs,
    required this.prot,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      title: json['title'],
      kcal: json['kcal'],
      carbs: json['carbs'],
      prot: json['proteins'],
      description: json['description'],
      imgUrl: json['imageUrl'],
    );
  }

}

Widget widgetMeal(){
  return Text('WidgetMeal');
}