import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FoodService.dart';


class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foods'),
      ),
      body: FutureBuilder<List<Food>>(
        future: FoodService.getFoods(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final foods = snapshot.data!;
            return ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];
                return ListTile(
                  leading: Image.network(" https://images.spoonacular.com/file/wximages/423186-636x393.png"),
                  title: Text(food.name),
                  subtitle: Text(food.description),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );

  }
}

