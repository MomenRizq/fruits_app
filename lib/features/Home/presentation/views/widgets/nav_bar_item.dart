import 'package:flutter/material.dart';
import 'package:fruits_app/features/Home/presentation/views/widgets/custom_bottom_app_bar.dart';
 
 import '../../../domain/entites/bottom_navigation_bar_entity.dart';
import 'active_item_nav_bar.dart';
import 'inactive_item_nav_bar,dart';

 
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
         ? const ActiveItem()
         : InActiveItem(
             image: bottomNavigationBarEntity.inActiveImage,
           );
   }
 }