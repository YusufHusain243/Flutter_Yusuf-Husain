import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/food/food_view_model.dart';
import 'package:flutter_application_1/screen/food/food_view_state.dart';
import 'package:provider/provider.dart';

class DetailFoodScreen extends StatefulWidget {
  int id;
  DetailFoodScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailFoodScreen> createState() => _DetailFoodScreenState();
}

class _DetailFoodScreenState extends State<DetailFoodScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var viewModel = Provider.of<FoodViewModel>(context, listen: false);
      await viewModel.getFoodId(widget.id.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Food',
          key: Key(
            'title_app_detail',
          ),
        ),
      ),
      body: Center(
        child: Consumer<FoodViewModel>(
          builder: (context, value, child) {
            if (value.state == FoodViewState.loading) {
              return const CircularProgressIndicator();
            }

            if (value.state == FoodViewState.error) {
              return const Text('Get Data Failed!');
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(value.foodId.name),
              ],
            );
          },
        ),
      ),
    );
  }
}
