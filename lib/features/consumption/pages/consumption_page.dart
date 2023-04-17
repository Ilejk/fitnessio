import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/consumption/providers/consumption_provider.dart';
import 'package:smart_home_app/features/consumption/widgets/meal_widget.dart';

class ConsumptionPage extends StatefulWidget {
  const ConsumptionPage({super.key});

  @override
  State<ConsumptionPage> createState() => _ConsumptionPageState();
}

class _ConsumptionPageState extends State<ConsumptionPage> {
  @override
  Widget build(BuildContext context) {
    final consumptionProvider =
        Provider.of<ConsumptionProvider>(context, listen: false);
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: FutureBuilder<void>(
          future: consumptionProvider.fetchAndSetMeals(),
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: consumptionProvider.meals.length,
                    itemBuilder: (context, index) {
                      return MealWidget(
                        title: consumptionProvider.meals[index].title,
                        amount: consumptionProvider.meals[index].amount,
                        calories: consumptionProvider.meals[index].calories,
                      );
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
