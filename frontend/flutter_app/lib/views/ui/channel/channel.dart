import 'package:flutter/material.dart';
import 'package:flutter_nodejs_app/controllers/exports.dart';
import 'package:flutter_nodejs_app/views/common/drawer/drawer_widget.dart';
import 'package:flutter_nodejs_app/views/common/exports.dart';
import 'package:flutter_nodejs_app/views/common/height_spacer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../common/app_bar.dart';

class ChannelPage extends StatelessWidget {
  const ChannelPage({super.key});

  @override
  Widget build(BuildContext context) {
    String date = DateTime.now().toString();
    var loginDate = date.substring(0, 11);
    var zoomnotifier = Provider.of<ZoomNotifier>(context);
    var onboardnotifier = Provider.of<OnBoardNotifier>(context);
    return Scaffold(
      
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: CustomAppBar(
          text: "My Channel",
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      
      backgroundColor: Color(scaffoldColor.value),
      
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const HeightSpacer(size: 50),
                  Text(
                    'in progress...',
                    style: appstyle(16, Color(kDark.value), FontWeight.normal),
                  ),
                  const HeightSpacer(size: 50),
                  

                ],
              ),
            ),
            
            Consumer<LoginNotifier>(
              builder: (context, value, child) {
                return Padding(
                  padding: EdgeInsets.all(10.0.h),
                  child: GestureDetector(
                    onTap: () {
                      zoomnotifier.currentIndex = 0;
                      onboardnotifier.isLastPage = false;
                      Get.to(() => const OnBoardingScreen());
                    },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ReusableText(
                        text: "Sign Out of all devices",
                        style:
                            appstyle(16, Color(kOrange.value), FontWeight.w600),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
