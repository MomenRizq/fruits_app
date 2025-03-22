import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/notification_widget.dart';

import '../utils/app_text_styles.dart';

AppBar CustomAppBar(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,

     actions: const [
       Padding(
         padding: EdgeInsets.symmetric(horizontal: 16),
         child: NotificationWidget(),
       )
     ],
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.bold19,
    ),
  );
}