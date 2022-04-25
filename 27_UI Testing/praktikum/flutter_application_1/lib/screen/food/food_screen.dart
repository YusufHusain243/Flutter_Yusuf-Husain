import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/food/detail_food_screen.dart';
import 'package:flutter_application_1/screen/food/food_view_model.dart';
import 'package:flutter_application_1/screen/food/food_view_state.dart';
import 'package:provider/provider.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var viewModel = Provider.of<FoodViewModel>(context, listen: false);
      await viewModel.getAllFood();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food',
          key: Key('title_app_food'),
        ),
      ),
      body: Consumer<FoodViewModel>(
        builder: (context, value, child) {
          if (value.state == FoodViewState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (value.state == FoodViewState.none) {
            return ListView.builder(
              itemCount: value.foods.length,
              itemBuilder: (context, index) {
                final food = value.foods[index];
                return GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailFoodScreen(
                            id: food.id,
                          ),
                        ),
                      );
                    },
                    title: Text(
                      food.name,
                      key: const Key(
                        'list_food',
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: Text('Get Data Failed!'),
          );
        },
      ),
    );
  }
}
