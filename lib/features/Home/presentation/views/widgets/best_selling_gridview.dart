import 'package:flutter/material.dart';
 
 import '../../../../../core/widgets/fruit_item.dart';
 
 class BestSellingGridView extends StatelessWidget {
   const BestSellingGridView({super.key});
 
   @override
   Widget build(BuildContext context) {
     return SliverGrid.builder(
         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
           childAspectRatio: 2 / 3.1,
           mainAxisSpacing: 8,
           crossAxisSpacing: 8,
         ),
         itemBuilder: (context, index) {
           return const FruitItem();
         });
   }
 }