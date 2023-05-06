import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/presentation/consumption/providers/consumption_provider.dart';
import 'package:smart_home_app/presentation/consumption/widgets/meal_widget.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/router/router.dart';

class ConsumptionPage extends StatefulWidget {
  const ConsumptionPage({super.key});

  @override
  State<ConsumptionPage> createState() => _ConsumptionPageState();
}

class _ConsumptionPageState extends State<ConsumptionPage> {
  Future<void> _handleRefresh() async {
    setState(() {
      Provider.of<ConsumptionProvider>(context, listen: false)
          .fetchAndSetMeals();
    });

    return await Future.delayed(
      const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final consumptionProvider =
        Provider.of<ConsumptionProvider>(context, listen: false);
    return SafeArea(
      child: LiquidPullToRefresh(
        height: SizeManager.s250.h,
        color: ColorManager.darkGrey,
        animSpeedFactor: 2,
        backgroundColor: ColorManager.white2,
        onRefresh: _handleRefresh,
        child: FutureBuilder<void>(
          future: consumptionProvider.fetchAndSetMeals(),
          builder: (context, snapshot) {
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: consumptionProvider.meals.length,
                        itemBuilder: (context, index) {
                          return MealWidget(
                            id: consumptionProvider.meals[index].id,
                            title: consumptionProvider.meals[index].title,
                            amount: consumptionProvider.meals[index].amount,
                            calories: consumptionProvider.meals[index].calories,
                            fats: consumptionProvider.meals[index].fats,
                            carbs: consumptionProvider.meals[index].carbs,
                            proteins: consumptionProvider.meals[index].proteins,
                            onPressed: (_) {
                              setState(() {
                                consumptionProvider.deleteMeal(
                                  consumptionProvider.meals[index].id,
                                );
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
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
