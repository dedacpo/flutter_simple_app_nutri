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

Widget widgetMeal(Meal meal, BuildContext context){
  return Column(children: [
     Image.network(meal.imgUrl),
      Text(
        meal.title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          meal.description,
          textAlign: TextAlign.center,
          style: TextStyle(height: 2),
        ),        
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${meal.kcal.toString()}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                  ),
                   Text(
                    'kcal',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${meal.prot.toString()}g',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'prot',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${meal.carbs.toString()}g',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'carbs',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
        ],
      )
  ],);
}