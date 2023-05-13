import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/presentation/profile/providers/profile_provider.dart';
import 'package:smart_home_app/presentation/profile/widgets/weight_number_column.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class WeightLineChart extends StatefulWidget {
  const WeightLineChart({
    super.key,
  });

  @override
  State<WeightLineChart> createState() => _WeightLineChartState();
}

class _WeightLineChartState extends State<WeightLineChart> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, child) => Padding(
        padding: const EdgeInsets.all(PaddingManager.p12),
        child: FutureBuilder<void>(
            future: profileProvider.fetchAndSetFlSpots(),
            builder: (context, snapshot) {
              return Container(
                decoration: BoxDecoration(
                  color: ColorManager.darkGrey,
                  border: Border.all(
                    color: ColorManager.grey3,
                    width: SizeManager.s3.w,
                  ),
                ),
                height: SizeManager.s250.h,
                width: deviceWidth,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: PaddingManager.p12,
                    top: PaddingManager.p12,
                  ),
                  child: Row(
                    children: [
                      const WeightNumberColumnWidget(),
                      SizedBox(
                        height: SizeManager.s250.h,
                        width: (deviceWidth - 66).w,
                        child: LineChart(
                          LineChartData(
                            minX: 1,
                            maxX: 12,
                            minY: 0,
                            maxY: 120,
                            titlesData: FlTitlesData(show: false),
                            gridData: FlGridData(show: false),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                spots: profileProvider.flSpots,
                                isCurved: true,
                                dotData: FlDotData(show: false),
                                color: ColorManager.limerGreen2,
                                barWidth: SizeManager.s3.w,
                                belowBarData: BarAreaData(
                                  color: ColorManager.limeGreenOp,
                                  show: true,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
