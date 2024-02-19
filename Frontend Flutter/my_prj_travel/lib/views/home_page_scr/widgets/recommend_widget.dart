import 'package:flutter/material.dart';
import 'package:my_prj_travel/models/detail_tour_model.dart';
import 'package:my_prj_travel/views/home_page_scr/widgets/building_item.dart';

class BuildingRecommendWidget extends StatelessWidget {
  const BuildingRecommendWidget({
    super.key,
    required this.tourModels,
    required this.idAcc,
  });

  final List<DetailTourModel> tourModels;
  final int idAcc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: tourModels.length,
        itemBuilder: (context, index) {
          return BuildingItem(
            height: 350,
            width: 280,
            margin: EdgeInsets.only(
              left: index == 0 ? 0 : 16,
            ),
            tourModel: tourModels[index],
            idAcc: idAcc,
          );
        },
      ),
    );
  }
}
