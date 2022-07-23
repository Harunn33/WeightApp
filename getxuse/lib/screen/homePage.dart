import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxuse/config/generalColors.dart';
import 'package:getxuse/screen/createRecord.dart';
import 'package:getxuse/screen/graphicPage.dart';
import 'package:getxuse/screen/recordsPage.dart';
import 'package:getxuse/view-models/controller.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Controller _controller = Get.put(Controller());
  int _bottomNavIndex = 0;
  Widget _currentScreen = GraphicPage();

  final iconList = <IconData>[Icons.show_chart, Icons.history];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentScreen,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsPalette.seaGreen,
        onPressed: () {
          //_controller.addRecord();
          Get.to(CreateRecord());
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: Get.height / 10,
        activeColor: Colors.white,
        inactiveColor: ColorsPalette.greyColor,
        splashRadius: 0,
        backgroundColor: ColorsPalette.seaGreen,
        icons: iconList,
        iconSize: 30,
        gapLocation: GapLocation.center,
        activeIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            _currentScreen = (index == 0) ? GraphicPage() : RecordsPage();
            // if (_bottomNavIndex == 0) {
            //   Get.to(GraphicPage());
            // } else {
            //   Get.to(RecordsPage());
            // }
          });
        },
      ),
    );
  }
}
