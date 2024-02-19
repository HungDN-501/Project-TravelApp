import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_prj_travel/bloc/bloc_detail_tour/detail_tour_bloc.dart';
import 'package:my_prj_travel/models/detail_tour_model.dart';
import 'package:my_prj_travel/routes/app_route_name.dart';
import 'package:my_prj_travel/theme/app_color.dart';

class BuildingItem extends StatelessWidget {
  const BuildingItem({
    super.key,
    this.showDetail = true,
    this.height,
    this.width,
    this.margin,
    required this.tourModel,
    required this.idAcc,
    this.valueSearch,
  });

  final bool showDetail;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final String? valueSearch;
  final int idAcc;

  final DetailTourModel tourModel;

  @override
  Widget build(BuildContext context) {
    bool isMark = tourModel.IsSave!;
    return BlocConsumer<DetailTourBloc, DetailTourState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRouteName.detailBuilding,
              arguments: tourModel, // Đối tượng truyền vào
            );
          },
          child: Container(
            height: height,
            width: width,
            margin: margin,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height != null ? height! * 0.5 : 200,
                  width: width,
                  child: Stack(
                    children: [
                      Container(
                        height: height != null ? height! * 0.5 : 200,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            // --- Image
                            image: NetworkImage(tourModel.Image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: InkWell(
                          onTap: () {
                            context.read<DetailTourBloc>().add(
                                  DetailTourHandleMarkTour(
                                      idAcc: idAcc,
                                      idTour: tourModel.TourID!,
                                      typeHandle: isMark ? 2 : 1),
                                );
                            if (valueSearch != null) {
                              context.read<DetailTourBloc>().add(
                                    DetailTourFetchedBySearch(
                                      keyWord: valueSearch!,
                                      idAcc: idAcc,
                                    ),
                                  );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              shape: BoxShape.circle,
                            ),
                            //------------------------------ --- Mark Tour
                            child: isMark
                                ? const Icon(
                                    CupertinoIcons.bookmark_fill,
                                    size: 20,
                                    color: Color.fromARGB(255, 5, 89, 137),
                                  )
                                : const Icon(
                                    CupertinoIcons.bookmark,
                                    size: 20,
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black87,
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(5, (index) {
                                  // --- Star
                                  return Icon(
                                    CupertinoIcons.star_fill,
                                    color: tourModel.Star! >= index + 1
                                        ? Colors.amber[600]
                                        : Colors.white,
                                    size: 20,
                                  );
                                }),
                              ),
                              if (!showDetail) ...[
                                const SizedBox(height: 8),
                                // --- Name tour
                                Text(
                                  tourModel.NameTour!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: Colors.white),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Nation : ${tourModel.NameNation!}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: Colors.white),
                                ),
                                // --- Price
                                Text(
                                  "\$${tourModel.Price} / person",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: Colors.white),
                                ),
                              ]
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (showDetail) ...[
                  // Text(
                  //   building.tag,
                  //   style: Theme.of(context).textTheme.bodySmall,
                  // ),
                  Text(
                    // --- NameTour
                    tourModel.NameTour!,
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // --- Mark tour
                      const Icon(
                        CupertinoIcons.placemark_fill,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        // --- Location
                        "${tourModel.NameLocation} - ${tourModel.NameNation}",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  //
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    //
                    children: [
                      Text(
                        "View ${getNamePlaceView(tourModel.PlaceView!).toString()}",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      // const SizedBox(width: 4),
                      // Text(
                      //   building.bathroom.toString(),
                      //   style: Theme.of(context).textTheme.bodySmall,
                      // ),
                      // const SizedBox(width: 16),
                      // const Text("Mountain"),
                      // const SizedBox(width: 4),
                      // Text(
                      //   building.bedroom.toString(),
                      //   style: Theme.of(context).textTheme.bodySmall,
                      // ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          // --- Price
                          text: "\$ ${tourModel.Price}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppColor.primaryColor),
                        ),
                        TextSpan(
                          text: " / person",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  )
                ]
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, DetailTourState state) async {
        if (state is HandleMarkTourSuccess) {
          // Lay thong tin Random va Star thanh cong
          if (state.resultModel.Status == 1) {
            isMark = !tourModel.IsSave!;
            context.read<DetailTourBloc>().add(
                  DetailTourFetchedRandomAndStar(idAcc: idAcc),
                );
          }
          // Lay thong tin Random va Star that bai
          else if (state.resultModel.Status == -1) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColor.caramel_4,
                content: Text(
                  state.resultModel.Message,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Error not undefined",
                ),
              ),
            );
          }
        }
      },
    );
  }

  String getNamePlaceView(int i) {
    switch (i) {
      case 1:
        return "Mountain";
      case 2:
        return "Beach";
      case 3:
        return "Forest";
      case 4:
        return "City";
      case 5:
        return "Desert";
      default:
        return "";
    }
  }
}
