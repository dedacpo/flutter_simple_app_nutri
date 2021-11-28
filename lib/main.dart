import 'package:flutter/material.dart';

import 'meal.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: widgetMeal(
              Meal(
                  carbs: 10,
                  title: 'asdada',
                  description: 'sadsa asd sadas dsada',
                  kcal: 10,
                  prot: 10,
                  imgUrl:
                      'https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png?w=640'),
              context)),
    );
  }
}
