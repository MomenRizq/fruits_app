import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/build_app_bar.dart';
import 'package:fruits_app/features/best_selling/view/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const routeName = '/bestselling';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: buildAppBar(),
       body: const BestSellingViewBody(),
     );
  }
}