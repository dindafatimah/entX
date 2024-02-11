import 'package:flutter/material.dart';
import 'info_card_small.dart';


class OverviewCardsSmallScreen extends StatelessWidget {
  const OverviewCardsSmallScreen({super.key});


  @override
  Widget build(BuildContext context) {
   double width = MediaQuery.of(context).size.width;

    return  SizedBox(
      height: 400,
      child: Column(
        children: [
          InfoCardSmall(
                        title: "Total Collections",
                        value: "500",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: width / 64,
                      ),
                      InfoCardSmall(
                        title: "Available Collections",
                        value: "359",
                        onTap: () {},
                      ),
                     SizedBox(
                        height: width / 64,
                      ),
                          InfoCardSmall(
                        title: "Active Members",
                        value: "463",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: width / 64,
                      ),
                      InfoCardSmall(
                        title: "Lent Collections",
                        value: "141",
                        onTap: () {},
                      ),
                  
        ],
      ),
    );
  }
}