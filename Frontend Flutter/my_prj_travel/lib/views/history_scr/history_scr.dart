import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_prj_travel/bloc/bloc_bill_booking/bill_booking_bloc.dart';
import 'package:my_prj_travel/models/bill_model.dart';
import 'package:my_prj_travel/theme/app_color.dart';
import 'package:my_prj_travel/views/history_scr/widgets/history_widget.dart';
import 'package:my_prj_travel/views/home_page_scr/home_scr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int idAcc = 0;
  List<HistoryBillModel> hitoryBills = [];

  void handleGetMarkTour() async {
    SharedPreferences prefsId = await SharedPreferences.getInstance();
    idAcc = idAcc = prefsId.getInt('accountID')!;
    // ignore: use_build_context_synchronously
    context.read<BillBookingBloc>().add(
          GetBillBookingByIdEvent(idAcc: idAcc),
        );
  }

  @override
  Widget build(BuildContext context) {
    handleGetMarkTour();
    return Scaffold(
      backgroundColor: AppColor.blue_3,
      extendBodyBehindAppBar: true,
      body: BlocConsumer<BillBookingBloc, BillBookingState>(
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
                          text: "History ",
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
                      // Item History
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 15,
                        ),
                        child: HistoryWidget(
                          historyBillModel: hitoryBills[index],
                        ),
                      );
                    },
                    childCount: hitoryBills.length,
                  ),
                ),
              )
            ],
          );
        },
        listener: (BuildContext context, BillBookingState state) async {
          if (state is GetHistoryBillBookingSuccess) {
            hitoryBills = state.listHistoryBill;
          }
        },
      ),
    );
  }
}
