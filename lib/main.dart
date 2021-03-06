import 'package:carousel_slider/carousel_slider.dart';
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
        primarySwatch: Colors.red,
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

  final newMealTitle = TextEditingController();
  final newMealDescription = TextEditingController();
  final newMealProt = TextEditingController();
  final newMealCarbs = TextEditingController();
  final newMealKcal = TextEditingController();
  final newMealImgUrl = TextEditingController();

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
          child: FutureBuilder<List<Meal>>(
        future: meals,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container();
          }
          return CarouselSlider(
            items: snapshot.data!.map((e) => widgetMeal(e, context)).toList(),
            options:
                CarouselOptions(height: MediaQuery.of(context).size.height),
          );
          //return Column(children: snapshot.data!.map((e) => widgetMeal(e, context)).toList()
        },
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showModalBottomSheet(
            context: context,
            builder: (_) {
              return Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 20,
                    right: 20),
                child: Form(
                  child: SingleChildScrollView(
                    child: AnimatedPadding(
                      padding: MediaQuery.of(context).viewInsets,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.decelerate,
                      child: Column(
                        children: [
                          TextField(
                            controller: newMealTitle,
                            decoration: InputDecoration(labelText: 'Nome'),
                          ),
                          TextFormField(
                            controller: newMealDescription,
                            decoration: InputDecoration(labelText: 'Descri????o'),
                          ),
                          TextFormField(
                            controller: newMealImgUrl,
                            decoration:
                                InputDecoration(labelText: 'Imagem URL'),
                          ),
                          TextFormField(
                              controller: newMealKcal,
                              decoration:
                                  InputDecoration(labelText: 'Calorias'),
                              keyboardType: TextInputType.number),
                          TextFormField(
                              controller: newMealProt,
                              decoration:
                                  InputDecoration(labelText: 'Prote??nas'),
                              keyboardType: TextInputType.number),
                          TextFormField(
                              controller: newMealCarbs,
                              decoration:
                                  InputDecoration(labelText: 'Carboidratos'),
                              keyboardType: TextInputType.number),
                          ElevatedButton(
                              onPressed: () {
                                print('newMealTitle' + newMealTitle.text);
                                final mealMap = Meal(
                                        title: newMealTitle.text,
                                        description: newMealDescription.text,
                                        imgUrl: newMealImgUrl.text,
                                        prot: int.parse(newMealProt.text),
                                        carbs: int.parse(newMealCarbs.text),
                                        kcal: int.parse(newMealKcal.text))
                                    .toJson();
                                Meals().postMeal(mealMap).then((value) {
                                  setState(() {
                                    meals = Meals().getMeals();
                                  });
                                  Navigator.pop(context);
                                });
                              },
                              child: Text('salvar'))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
