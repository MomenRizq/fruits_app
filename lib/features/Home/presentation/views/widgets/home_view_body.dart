import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/search_text_field.dart';
import 'package:fruits_app/features/Home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruits_app/features/Home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:fruits_app/features/Home/presentation/views/widgets/featured_list.dart';

import 'featured_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: const CustomScrollView(
        slivers: [
       SliverToBoxAdapter(
        child:Column(
          spacing: 16,
          children: [
            CustomHomeAppbar(),
            SearchTextField(),
            FeaturedList(),
            BestSellingHeader()
          ],
        ) ,
       )
        ],
      ),
    );
  }
}