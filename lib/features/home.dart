import 'package:flutter/material.dart';
import 'package:gesture/constants/app_exports.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppAssets.following,
              style: AppStyle.mNeutral500,
            ),
            AppConstants.h20,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Iconsax.google_1),
                Icon(Iconsax.apple),
                Icon(Iconsax.facebook),
              ],
            ),
            AppConstants.h20,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Iconsax.home),
                Icon(Iconsax.home_1),
                Icon(Iconsax.home_copy),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
