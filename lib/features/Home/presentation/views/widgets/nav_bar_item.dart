import 'package:flutter/material.dart';
import 'package:fruits_app/features/Home/presentation/views/widgets/active_item_nav_bar.dart';
import 'package:fruits_app/features/Home/presentation/views/widgets/inactive_item_nav_bar.dart';

import '../../../domain/entites/bottom_navigation_bar_entity.dart';

class NaivgationBarItem extends StatelessWidget {
  const NaivgationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});

  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
            text: bottomNavigationBarEntity.name,
          )
        : InActiveItem(
            image: bottomNavigationBarEntity.inActiveImage,
          );
  }
}