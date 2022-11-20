import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zekademy_project/constants.dart';
import 'package:zekademy_project/models/user.dart';

class UserDetailView extends StatelessWidget {
  UserDetailView(this.user, this.image, {super.key});
  User user;
  String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        leading: InkWell(
          onTap: (() => Get.back()),
          child: const Image(
              width: 24,
              height: 24,
              image: AssetImage("assets/icons/Arrow - Left.png")),
        ),
        backgroundColor: Colors.white,
        title: Text(
          user.name ?? "",
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.contain),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(6)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name ?? "",
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text(
                        '@${user.username ?? ""}',
                        style: TextStyle(
                            color: AppTheme.secFontColor, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Email: ',
                style: TextStyle(fontSize: 14, color: AppTheme.secFontColor)),
            TextSpan(
              text: user.email,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ])),
          const SizedBox(
            height: 12,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Address: ',
                style: TextStyle(fontSize: 14, color: AppTheme.secFontColor)),
            TextSpan(
              text:
                  " ${user.address!.suite!}, ${user.address!.street!}, ${user.address!.city!}, ${user.address!.zipcode!}",
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ])),
          const SizedBox(
            height: 12,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Phone: ',
                style: TextStyle(fontSize: 14, color: AppTheme.secFontColor)),
            TextSpan(
              text: user.phone!.split('x')[0],
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ])),
          const SizedBox(
            height: 12,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Website: ',
                style: TextStyle(fontSize: 14, color: AppTheme.secFontColor)),
            TextSpan(
              text: user.website,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ])),
          const SizedBox(
            height: 12,
          ),
        ]),
      ),
    );
  }
}
