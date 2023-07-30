/// 
/// PROJECT_NAME: app & FILE_NAME: app_bar_widget
/// Created by Vinoth Kumar on 29/07/23.
///
///
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/assets.dart';
import '../constant/constant.dart';
/// Custom AppBar
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimary,
      elevation: 0, // Remove shadow from the app bar
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rajinikanth',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kWhite,
                ),
              ),
              SvgPicture.asset(star, semanticsLabel: 'Thalaivar')
            ],
          ),
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(
                'assets/avatar.png'), // Replace with your profile image
          ),
        ],
      ),
    );
  }
}