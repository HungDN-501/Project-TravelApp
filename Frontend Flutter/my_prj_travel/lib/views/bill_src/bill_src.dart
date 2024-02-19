import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_prj_travel/bloc/bloc_bill_booking/bill_booking_bloc.dart';
import 'package:my_prj_travel/models/bill_model.dart';
import 'package:my_prj_travel/theme/app_color.dart';
import 'package:my_prj_travel/views/home_page_scr/home_scr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  int idAcc = 0;

  void handleGetIdAccount() async {
    SharedPreferences prefsId = await SharedPreferences.getInstance();
    idAcc = prefsId.getInt('accountID')!;
  }

  String formatDate(String inputDate) {
    DateTime parsedDate = DateFormat("dd-MM-yyyy").parse(inputDate);
    String formattedDate = DateFormat("yyyy-MM-dd").format(parsedDate);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    handleGetIdAccount();
    final destination =
        ModalRoute.of(context)?.settings.arguments as BillTourModel;
    return Scaffold(
      backgroundColor: AppColor.blue_4,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: BlocConsumer<BillBookingBloc, BillBookingState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  bottom: MediaQuery.of(context).padding.bottom,
                  left: 24,
                  right: 24,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: AppColor.blue_2,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Bill",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(color: AppColor.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "${destination.detailTourModel!.NameTour} in ${destination.detailTourModel!.NameLocation}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    color: AppColor.blue_2,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        children: [
                                          const TextSpan(
                                            text: "Booker : ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "${destination.booker}",
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        children: [
                                          const TextSpan(
                                            text: "Phone Number : ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "${destination.phone}",
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        children: [
                                          const TextSpan(
                                            text: "Number Of People : ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "${destination.numberPeople}",
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        children: [
                                          const TextSpan(
                                            text: "Departure Schedule : ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "${destination.departureSchedule}",
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.titleMedium,
                              children: [
                                const TextSpan(
                                  text: "Total : ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "${(destination.detailTourModel!.Price! * destination.numberPeople!)}  \$",
                                  style: const TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.titleLarge,
                            children: const [
                              TextSpan(
                                text:
                                    "Please check your bill and confirm booking",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 64,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  AppColor.blue_2),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                context.read<BillBookingBloc>().add(
                                      CreateBillBookingEvent(
                                        tourId: destination
                                            .detailTourModel!.TourID!,
                                        accId: idAcc,
                                        booker: destination.booker!,
                                        phone: destination.phone!,
                                        numPeople: destination.numberPeople!,
                                        departureSchedule: formatDate(
                                            destination.departureSchedule!),
                                        total: (destination
                                                .detailTourModel!.Price! *
                                            destination.numberPeople!),
                                      ),
                                    );
                              },
                              child: Text(
                                "Confirm",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: AppColor.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              );
            },
          );
        },
        listener: (BuildContext context, BillBookingState state) async {
          if (state is CreateBillBookingSuccess) {
            if (state.resultModel.Status == 1) {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Booking Success'),
                  content: Text(
                      "Thank you for your trust and support. Please come to this address on ${destination.departureSchedule!} so we can help you start your trip."),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                        (Route<dynamic> route) => false,
                      ),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            } else if (state.resultModel.Status == -1) {
              // ignore: use_build_context_synchronously
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
              // ignore: use_build_context_synchronously
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
      ),
    );
  }
}
