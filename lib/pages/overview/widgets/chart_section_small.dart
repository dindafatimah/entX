import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/bar_chart.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/activity_info.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';

class ChartSectionSmall extends StatelessWidget {
  const ChartSectionSmall({super.key});


  @override
  Widget build(BuildContext context) {
    return  Container(
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 6),
                        color: lightGrey.withOpacity(.1),
                        blurRadius: 12)
                  ],
                  border: Border.all(color: lightGrey, width: .5),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 260,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CustomText(
                            text: "Lent Books",
                            size: 20,
                            weight: FontWeight.bold,
                            color: lightGrey,
                          ),
                          SizedBox(
                              width: 600,
                              height: 200,
                              child: SimpleBarChart.withSampleData()),
                        ],
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 1,
                      color: lightGrey,
                    ),
                    const SizedBox(
                      height: 260,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              ActivityInfo(
                                title: "Today",
                                amount: "24",
                              ),
                              ActivityInfo(
                                title: "Last 7 days",
                                amount: "58",
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              ActivityInfo(
                                title: "Last 30 days",
                                amount: "248",
                              ),
                              ActivityInfo(
                                title: "Last 12 months",
                                amount: "1,124",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
}