import 'package:flutter/material.dart';
import 'package:my_prj_travel/theme/app_color.dart';
import 'package:my_prj_travel/views/home_page_scr/model/tourist_places.dart';

// SliverPersistentHeaderDelegate : tiêu đề cuộn tùy chỉnh trong danh sách cuộn
class CategoryWidget extends SliverPersistentHeaderDelegate {
  final int? index;

  CategoryWidget({
    required this.index,
  });

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => 0;

  // check xem phần tiêu đề cuộn cần phải được xây dựng lại khi có sự thay đổi hay không
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return this != oldDelegate;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColor.blue_2,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      // Wrap(bọc) : xếp các widget con theo hàng và cột, tự động xuống dòng khi không đủ không gian
      child: LocationItem(indexChosse: index),
    );
  }
}

// ignore: must_be_immutable
class LocationItem extends StatefulWidget {
  LocationItem({super.key, required this.indexChosse});

  final int? indexChosse;

  @override
  State<LocationItem> createState() => _LocationItemState();
}

class _LocationItemState extends State<LocationItem> {
  int? value;
  @override
  Widget build(BuildContext context) {
    // return Wrap(
    //   spacing: 0, // Đặt khoảng cách ngang giữa các widget con
    //   runSpacing: 0, // Khoảng cách dọc giữa các dòng của các widget
    //   children: [
    //     InkWell(
    //       onTap: () {
    //         widget.indexChosse = 0;
    //       },
    //       child: _CategoryItem(
    //         title: touristPlaces[0].name,
    //         image: touristPlaces[0].image,
    //         index: 0,
    //         indexChosse: widget.indexChosse,
    //       ),
    //     ),
    //     InkWell(
    //       onTap: () {
    //         widget.indexChosse = 1;
    //       },
    //       child: _CategoryItem(
    //         title: touristPlaces[1].name,
    //         image: touristPlaces[1].image,
    //         index: 1,
    //         indexChosse: widget.indexChosse,
    //       ),
    //     ),
    //     InkWell(
    //       onTap: () {
    //         widget.indexChosse = 2;
    //       },
    //       child: _CategoryItem(
    //         title: touristPlaces[2].name,
    //         image: touristPlaces[2].image,
    //         index: 2,
    //         indexChosse: widget.indexChosse,
    //       ),
    //     ),
    //     InkWell(
    //       onTap: () {
    //         widget.indexChosse = 3;
    //       },
    //       child: _CategoryItem(
    //         title: touristPlaces[3].name,
    //         image: touristPlaces[3].image,
    //         index: 3,
    //         indexChosse: widget.indexChosse,
    //       ),
    //     ),
    //     InkWell(
    //       onTap: () {
    //         widget.indexChosse = 4;
    //       },
    //       child: _CategoryItem(
    //         title: touristPlaces[4].name,
    //         image: touristPlaces[4].image,
    //         index: 4,
    //         indexChosse: widget.indexChosse,
    //       ),
    //     ),
    //   ],
    // );
    return ListView.builder(
      itemBuilder: (context, index) {
        return _CategoryItem(
          title: touristPlaces[4].name,
          image: touristPlaces[4].image,
          index: 4,
          indexChosse: widget.indexChosse,
        );
      },
      itemCount: touristPlaces.length,
    );
  }
}

// ignore: must_be_immutable
class _CategoryItem extends StatefulWidget {
  _CategoryItem({
    required this.title,
    required this.image,
    required this.index,
    required this.indexChosse,
  });

  final String title;
  final String image;
  final int index;
  int? indexChosse;

  @override
  State<_CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<_CategoryItem> {
  bool isChoose = false;

  @override
  Widget build(BuildContext context) {
    // print("IsChose = ${widget.isChoose}");
    if (widget.index == widget.indexChosse) {
      isChoose = true;
    }
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Chip(
        label: Text(
          widget.title,
          style: TextStyle(
            fontSize: 18,
            color: isChoose == true ? Colors.white : Colors.black,
          ),
        ),
        avatar: CircleAvatar(
          backgroundImage: AssetImage(widget.image),
        ),
        backgroundColor: isChoose == true ? Colors.black : AppColor.white,
        //elevation: 0.4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
