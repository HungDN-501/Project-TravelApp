import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_prj_travel/models/bill_model.dart';
import 'package:my_prj_travel/theme/app_color.dart';

class HistoryWidget extends StatelessWidget {
  final HistoryBillModel? historyBillModel;
  const HistoryWidget({
    super.key,
    this.historyBillModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Name Tour",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColor.blue_2,
                      ),
                ),
              ],
            ),
            Text(
              "Booker : ${historyBillModel!.booker!}",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              "Phone : ${historyBillModel!.phone!}",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              "Number of People : ${historyBillModel!.numPeople!}",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              "Departure Schedule : ${formatDate(historyBillModel!.departureSchedule!)}",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              "Total : ${historyBillModel!.total!}",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(String time) {
    DateTime parsedDate = DateTime.parse(time);
    String formattedDate = DateFormat("dd-MM-yyyy").format(parsedDate);
    return formattedDate;
  }
}
