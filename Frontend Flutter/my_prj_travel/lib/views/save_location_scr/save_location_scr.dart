import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_prj_travel/bloc/bloc_detail_tour/detail_tour_bloc.dart';
import 'package:my_prj_travel/models/detail_tour_model.dart';
import 'package:my_prj_travel/theme/app_color.dart';
import 'package:my_prj_travel/views/home_page_scr/home_scr.dart';
import 'package:my_prj_travel/views/save_location_scr/widget/item_save_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveLocationScreen extends StatefulWidget {
  const SaveLocationScreen({
    super.key,
  });

  @override
  State<SaveLocationScreen> createState() => _SaveLocationScreenState();
}

class _SaveLocationScreenState extends State<SaveLocationScreen> {
  int idAcc = 0;
  List<DetailTourModel> detailMarkTour = [];

  void handleGetMarkTour() async {
    SharedPreferences prefsId = await SharedPreferences.getInstance();
    idAcc = idAcc = prefsId.getInt('accountID')!;
    // ignore: use_build_context_synchronously
    context.read<DetailTourBloc>().add(
          DetailMarkTourFetched(idAcc: idAcc),
        );
  }

  @override
  Widget build(BuildContext context) {
    handleGetMarkTour();

    return Scaffold(
      backgroundColor: AppColor.blue_3,
      extendBodyBehindAppBar: true,
      body: BlocConsumer<DetailTourBloc, DetailTourState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              // ----------- AppBar ------------
              SliverAppBar(
                backgroundColor: AppColor.blue_2,
                pinned: true, // cho phép không bị ẩn appbar khi cuộn
                centerTitle: true,
                elevation: 0,
                titleSpacing: 0,
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Saved Locations",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: AppColor.white,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColor.black,
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(top: 20),
              ),
              // Place popular in Indonesia
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return BuildingItemSaveLoacation(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(bottom: 16),
                        tourModel: detailMarkTour[index],
                        idAcc: idAcc,
                      );
                    },
                    childCount: detailMarkTour.length,
                  ),
                ),
              ),
            ],
          );
        },
        listener: (BuildContext context, DetailTourState state) async {
          if (state is GetDetailMarkTourSuccess) {
            detailMarkTour = state.listDetailMarkTourModel;
          }
        },
      ),
    );
  }
}
