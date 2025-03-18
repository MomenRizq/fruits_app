import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/features/Home/presentation/views/widgets/nav_bar_item.dart';

import '../../../domain/entites/bottom_navigation_bar_entity.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 375,
        height: 70,
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 25,
              offset: Offset(0, -2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
            children: bottomNavigationBarItems.map(
          (e) {
            return NaivgationBarItem(
              bottomNavigationBarEntity: e,
              isSelected: false,
            );
          },
        ).toList()));
  }
}
