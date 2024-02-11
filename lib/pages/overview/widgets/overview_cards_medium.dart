import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/info_card.dart';


class OverviewCardsMediumScreen extends StatelessWidget {
  const OverviewCardsMediumScreen({super.key});


  @override
  Widget build(BuildContext context) {
   double width = MediaQuery.of(context).size.width;

    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
                  children: [
                    InfoCard(
                      title: "Total Collections",
                      value: "500",
                      onTap: () {},
                      topColor: Colors.orange,

                    ),
                    SizedBox(
                      width: width / 64,
                    ),
                    InfoCard(
                      title: "Available Collections",
                      value: "359",
                      topColor: Colors.lightGreen,
                      onTap: () {},
                    ),
                  
                  ],
                ),
            SizedBox(
                      height: width / 64,
                    ),
                  Row(
                  children: [
             
                    InfoCard(
                      title: "Active Members",
                      value: "463",
                      topColor: const Color.fromARGB(255, 82, 97, 255),
                      onTap: () {},
                    ),
                    SizedBox(
                      width: width / 64,
                    ),
                    InfoCard(
                      title: "Scheduled deliveries",
                      value: "32",
                      onTap: () {},
                    ),
                
                  ],
                ),
      ],
    );
  }
}