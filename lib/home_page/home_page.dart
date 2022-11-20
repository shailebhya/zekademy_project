import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zekademy_project/constants.dart';
import 'package:zekademy_project/home_page/home_ctrl.dart';
import 'package:zekademy_project/home_page/views/user_list_view.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeCtrl = Get.put<HomeCtrl>(HomeCtrl());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeCtrl.homePageCtrl = PageController(initialPage: 1);
    homeCtrl.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Image(image: AssetImage("assets/icons/Logo.png")),
        backgroundColor: Colors.white,
        actions: const [
          Image(image: AssetImage("assets/icons/Notification.png")),
          Image(image: AssetImage("assets/icons/Search.png"))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppTheme.primaryColor,
          type: BottomNavigationBarType.fixed,
          onTap: ((value) {
            setState(() {
              homeCtrl.activeIndex = value;
            });
          }),
          selectedLabelStyle: TextStyle(color: AppTheme.primaryColor),
          currentIndex: homeCtrl.activeIndex,
          items: bottomNavItems),
      body: PageView(
        controller: homeCtrl.homePageCtrl,
        onPageChanged: (value) => setState(() {
          homeCtrl.activeIndex = value;
        }),
        children: [
          Container(),
          UserList(),
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  List<BottomNavigationBarItem> get bottomNavItems {
    return [
      BottomNavigationBarItem(
          label: "Home",
          tooltip: "Home",
          activeIcon: Image(
              color: AppTheme.primaryColor,
              image: const AssetImage("assets/icons/Home.png")),
          icon: const Image(image: AssetImage("assets/icons/Home.png"))),
      BottomNavigationBarItem(
          label: "People",
          tooltip: "People",
          activeIcon: Image(
              color: AppTheme.primaryColor,
              image: AssetImage("assets/icons/3 User.png")),
          icon: Image(
              color: AppTheme.secondaryColor,
              image: AssetImage("assets/icons/3 User.png"))),
      BottomNavigationBarItem(
          label: "Create",
          tooltip: "Create",
          activeIcon: Image(
              color: AppTheme.primaryColor,
              image: AssetImage("assets/icons/Plus.png")),
          icon: Image(image: AssetImage("assets/icons/Plus.png"))),
      BottomNavigationBarItem(
          label: "Activities",
          tooltip: "Activities",
          activeIcon: Image(
              color: AppTheme.primaryColor,
              image: AssetImage("assets/icons/Heart.png")),
          icon: Image(image: AssetImage("assets/icons/Heart.png"))),
      BottomNavigationBarItem(
          label: "Profile",
          tooltip: "Profile",
          activeIcon: Image(
              color: AppTheme.primaryColor,
              image: AssetImage("assets/icons/Profile.png")),
          icon: Image(image: AssetImage("assets/icons/Profile.png"))),
    ];
  }
}
