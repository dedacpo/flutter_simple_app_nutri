import 'package:flutter/material.dart';

import 'meal.dart';
import 'provider_meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

late Future<List<Meal>> meals;

@override
  void initState() {
    super.initState();
    meals = Meals().getMeals();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: FutureBuilder<List<Meal>>(future: meals, builder: (context, snapshot) {
            if(snapshot.data == null){
              return Container();
            }
            return Column(children: snapshot.data!.map((e) => widgetMeal(e, context)).toList()
            );
          },) 
      ),
    );
  }
}
