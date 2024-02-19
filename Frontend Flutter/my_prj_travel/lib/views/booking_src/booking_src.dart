import 'package:flutter/material.dart';
import 'package:my_prj_travel/models/bill_model.dart';
import 'package:my_prj_travel/models/detail_tour_model.dart';
import 'package:my_prj_travel/routes/app_route_name.dart';
import 'package:my_prj_travel/theme/app_color.dart';
import 'package:my_prj_travel/widgets/app_text_field.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController numPeopleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final destination =
        ModalRoute.of(context)?.settings.arguments as DetailTourModel;
    FocusScopeNode currentFocus = FocusScope.of(context);
    return GestureDetector(
      onTap: () {
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
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
        body: ListView.builder(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Booking",
                        style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: AppColor.blue_2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppTextField(
                        prefix: const Icon(Icons.person_outline),
                        hint: "Username",
                        textInputAction: TextInputAction.done,
                        obscureText: false,
                        controller: userNameController,
                      ),
                      const SizedBox(height: 35),
                      AppTextField(
                        prefix: const Icon(Icons.phone_outlined),
                        keyboardType: TextInputType.number,
                        hint: "Phone Number",
                        textInputAction: TextInputAction.done,
                        obscureText: false,
                        controller: phoneController,
                      ),
                      const SizedBox(height: 35),
                      AppTextField(
                        prefix: const Icon(Icons.people_outline),
                        keyboardType: TextInputType.number,
                        hint: "Number Of People",
                        textInputAction: TextInputAction.done,
                        obscureText: false,
                        controller: numPeopleController,
                      ),
                      const SizedBox(height: 35),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Departure Schedule",
                          filled: true,
                          prefixIcon: const Icon(Icons.calendar_today),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.blue_2),
                          ),
                        ),
                        readOnly: true,
                        onTap: () {
                          _selectDate();
                        },
                        controller: dateController,
                      ),
                    ],
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
                              text: "Please check information before confirm",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 64,
                        child: ElevatedButton(
                          onPressed: () {
                            if (dateController.text.trim().isEmpty ||
                                userNameController.text.trim().isEmpty ||
                                phoneController.text.trim().isEmpty ||
                                numPeopleController.text.trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColor.caramel_4,
                                  content: const Text(
                                    "Please enter enough information",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            } else {
                              BillTourModel billTourModel = BillTourModel(
                                booker: userNameController.text.trim(),
                                phone: int.parse(
                                  phoneController.text.trim(),
                                ),
                                numberPeople: int.parse(
                                  numPeopleController.text.trim(),
                                ),
                                departureSchedule: dateController.text.trim(),
                                detailTourModel: destination,
                              );
                              Navigator.pushNamed(
                                context,
                                AppRouteName.bill,
                                arguments: billTourModel,
                              );
                            }
                          },
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
                          child: Text(
                            "Confirm",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: AppColor.white),
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
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        dateController.text = "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }
}
