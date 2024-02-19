import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_prj_travel/bloc/bloc_detail_tour/detail_tour_bloc.dart';
import 'package:my_prj_travel/models/detail_tour_model.dart';
import 'package:my_prj_travel/theme/app_color.dart';
import 'package:my_prj_travel/views/home_page_scr/draws/draw_src.dart';
import 'package:my_prj_travel/views/home_page_scr/widgets/building_item.dart';
import 'package:my_prj_travel/views/home_page_scr/widgets/recommend_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controlTextSearch = TextEditingController();
  bool isSearch = false;
  bool isLoading = true;

  List<DetailTourModel> detailTourRandoms = [];
  List<DetailTourModel> detailTourStars = [];
  List<DetailTourModel> detailTourSearch = [];

  int idAcc = 0;
  String userName = "";
  String avatar = "";
  String email = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getId().then((value) {
      idAcc = value;
    });
    context.read<DetailTourBloc>().add(
          DetailTourFetchedRandomAndStar(idAcc: idAcc),
        );
    getUserName().then((value) {
      userName = value;
    });
    getAvatar().then((value) {
      avatar = value;
    });
    getEmail().then((value) {
      email = value;
    });
    FocusScopeNode currentFocus = FocusScope.of(context);
    return GestureDetector(
      onTap: () {
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        drawer: DrawScreen(
          avatar: avatar,
          userName: userName,
          email: email,
        ),
        backgroundColor: AppColor.blue_3,
        body: BlocConsumer<DetailTourBloc, DetailTourState>(
          listener: (BuildContext context, DetailTourState state) async {
            if (state is GetDetailTourRandomAndStarSuccess) {
              // Lay thong tin Random va Star thanh cong
              if (state.listDetailTourModelRandom.isNotEmpty &&
                  state.listDetailTourModelStar.isNotEmpty) {
                detailTourRandoms = state.listDetailTourModelRandom;
                detailTourStars = state.listDetailTourModelStar;
                isLoading = false;
              }
              // Lay thong tin Random va Star that bai
              else if (state.listDetailTourModelRandom.isEmpty &&
                  state.listDetailTourModelStar.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColor.caramel_4,
                    content: const Text(
                      "Not get data from API Recommend and Most stars",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
                isLoading = true;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Error not undefined",
                    ),
                  ),
                );
                isLoading = true;
              }
            }

            if (state is GetDetailTourSearchSuccess) {
              detailTourSearch = state.listDetailTourModelSearch;
              isLoading = false;
            }
          },
          builder: (context, state) {
            return isLoading
                ? const Center(child: CircularProgressIndicator())
                : CustomScrollView(
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
                                  text: "Hello, ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: AppColor.white,
                                      ),
                                ),
                                TextSpan(
                                  text: userName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: AppColor.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {
                              // setState(() {
                              //   _getCategory();
                              // });
                            },
                            icon: Icon(
                              Icons.notifications_rounded,
                              color: AppColor.white,
                            ),
                          ),
                          const SizedBox(width: 24),
                        ],
                        // PreferredSize : Sử dụng kích thước ưu tiên tùy chỉnh
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(76),
                          child: SizedBox(
                            child: Container(
                              height: 56,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 10,
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    CupertinoIcons.search,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: TextField(
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          setState(() {
                                            isSearch = true;
                                            context.read<DetailTourBloc>().add(
                                                  DetailTourFetchedBySearch(
                                                    keyWord: value,
                                                    idAcc: idAcc,
                                                  ),
                                                );
                                          });
                                        } else {
                                          setState(() {
                                            isSearch = false;
                                            // context.read<DetailTourBloc>().add(
                                            //       DetailTourFetchedRandomAndStar(),
                                            //     );
                                          });
                                        }
                                      },
                                      controller: controlTextSearch,
                                      cursorColor: AppColor.black,
                                      decoration: const InputDecoration(
                                        hintText: "Name place or nation",
                                        border:
                                            InputBorder.none, // bỏ gạch ngang
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Tạo ra một phần tiêu đề
                      // isSearch
                      //     ? SliverPersistentHeader(
                      //         delegate: CategoryWidget(index: indexSearch),
                      //       )
                      //     : const SliverPadding(
                      //         padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      //       ),
                      const SliverPadding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      ),
                      isSearch
                          ? const SliverPadding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            )
                          : SliverPadding(
                              padding: const EdgeInsets.fromLTRB(24, 0, 24, 10),
                              // SliverToBoxAdapter : là một sliver chứa một widget bình thường
                              sliver: SliverToBoxAdapter(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Recommend",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    Text(
                                      "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: AppColor.primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      // Recommend
                      isSearch
                          ? const SliverPadding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            )
                          : SliverToBoxAdapter(
                              child: BuildingRecommendWidget(
                                tourModels: detailTourRandoms,
                                idAcc: idAcc,
                              ),
                            ),
                      isSearch
                          ? const SliverPadding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            )
                          : SliverPadding(
                              padding: const EdgeInsets.all(24),
                              sliver: SliverToBoxAdapter(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Most Stars",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      // Most Stars
                      isSearch
                          ? const SliverPadding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            )
                          : SliverPadding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              sliver: SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    return BuildingItem(
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.only(bottom: 16),
                                      showDetail: false,
                                      tourModel: detailTourStars[index],
                                      idAcc: idAcc,
                                    );
                                  },
                                  childCount: detailTourStars.length,
                                ),
                              ),
                            ),
                      // Is Search
                      isSearch
                          ? SliverPadding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              sliver: SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    return BuildingItem(
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.only(bottom: 16),
                                      showDetail: false,
                                      tourModel: detailTourSearch[index],
                                      idAcc: idAcc,
                                      valueSearch:
                                          controlTextSearch.text.trim(),
                                    );
                                  },
                                  childCount: detailTourSearch.length,
                                ),
                              ),
                            )
                          : const SliverPadding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            ),
                    ],
                  );
          },
        ),
      ),
    );
  }

  getAvatar() async {
    SharedPreferences prefsAvatar = await SharedPreferences.getInstance();
    return prefsAvatar.getString('avatar') == ""
        ? "https://cdn-icons-png.flaticon.com/128/149/149071.png"
        : prefsAvatar.getString('avatar')!;
  }

  getUserName() async {
    SharedPreferences prefsUserName = await SharedPreferences.getInstance();
    return prefsUserName.getString('userName')!;
  }

  getEmail() async {
    SharedPreferences prefsEmail = await SharedPreferences.getInstance();
    return prefsEmail.getString('email')!;
  }

  getId() async {
    SharedPreferences prefsId = await SharedPreferences.getInstance();
    return prefsId.getInt('accountID')!;
  }
}
