import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zekademy_project/home_page/home_ctrl.dart';
import 'package:zekademy_project/home_page/views/user_detail_view.dart';

import '../../constants.dart';

class UserList extends StatelessWidget {
  UserList({
    Key? key,
  }) : super(key: key);
  final homeCtrl = Get.find<HomeCtrl>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeCtrl>(
        id: userListId,
        builder: (_) {
          return ListView.builder(
              itemCount: homeCtrl.userList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(right: 14, left: 14.0, top: 12),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppTheme.tertiaryColor),
                        borderRadius: BorderRadius.circular(8)),
                    leading: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/dp/${index > 4 ? index ~/ 2 + 1 : index + 1}.png")),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)),
                      height: 56,
                      width: 56,
                    ),
                    trailing: GestureDetector(
                      onTap: (() => homeCtrl.userList[index] == null
                          ? Get.snackbar(
                              "Something went wrong", "Please Reload the app")
                          : Get.to(UserDetailView(homeCtrl.userList[index]!,
                              "assets/dp/${index > 4 ? index ~/ 2 + 1 : index + 1}.png"))),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border:
                                  Border.all(color: AppTheme.tertiaryColor)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 17.0, vertical: 7),
                            child: Text(
                              "View",
                              style: TextStyle(color: AppTheme.primaryColor),
                            ),
                          )),
                    ),
                    tileColor: Colors.white,
                    title: Text(
                      homeCtrl.userList[index]!.name.toString(),
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      '@${homeCtrl.userList[index]!.username}',
                      style:
                          TextStyle(fontSize: 12, color: AppTheme.secFontColor),
                    ),
                  ),
                );
              });
        });
  }
}
