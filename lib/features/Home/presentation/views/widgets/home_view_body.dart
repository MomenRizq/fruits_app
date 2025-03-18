import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/core/widgets/fruit_item.dart';
import 'package:fruits_app/core/widgets/search_text_field.dart';
import 'package:fruits_app/features/Home/presentation/views/widgets/best_selling_gridview.dart';
import 'package:fruits_app/features/Home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruits_app/features/Home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:fruits_app/features/Home/presentation/views/widgets/featured_list.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        slivers: [
       SliverToBoxAdapter(
        child:Column(
          spacing: 16,
          children: [
            const CustomHomeAppbar(),
            const SearchTextField(),
            const FeaturedList(),
            const BestSellingHeader(),
            SizedBox(height: 8),
          ],
        ) ,
       ),
       
       BestSellingGridView(),
        ],
      ),
    );
  }
}