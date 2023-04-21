import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/consumption/providers/consumption_provider.dart';
import 'package:smart_home_app/features/consumption/widgets/meal_widget.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/router/router.dart';

class ConsumptionPage extends StatefulWidget {
  const ConsumptionPage({super.key});

  @override
  State<ConsumptionPage> createState() => _ConsumptionPageState();
}

class _ConsumptionPageState extends State<ConsumptionPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final consumptionProvider =
          Provider.of<ConsumptionProvider>(context, listen: false);
      final meals = await consumptionProvider.fetchAndSetMeals();
      if (meals != null && meals.isNotEmpty) {
        final lastMealDateTime = meals.last.dateTime;
        final now = DateTime.now();
        if (now.year > lastMealDateTime.year ||
            now.month > lastMealDateTime.month ||
            now.day > lastMealDateTime.day) {
          await consumptionProvider.clearMealsIfDayChanges(lastMealDateTime);
        }
      }
    });
  }

  Future<void> _handleRefresh() async {
    setState(() {
      Provider.of<ConsumptionProvider>(context, listen: false)
          .fetchAndSetMeals();
    });

    return await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final consumptionProvider =
        Provider.of<ConsumptionProvider>(context, listen: false);
    return SafeArea(
      child: LiquidPullToRefresh(
        height: SizeManager.s250,
        color: ColorManager.darkGrey,
        animSpeedFactor: 2,
        backgroundColor: ColorManager.white2,
        onRefresh: _handleRefresh,
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
                        fats: consumptionProvider.meals[index].fats,
                        carbs: consumptionProvider.meals[index].carbs,
                        proteins: consumptionProvider.meals[index].proteins,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(PaddingManager.p12),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      backgroundColor: ColorManager.limerGreen2,
                      child: const Icon(
                        Icons.water_drop_outlined,
                        color: ColorManager.darkGrey,
                        size: SizeManager.s28,
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushNamed(Routes.addWaterRoute),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
