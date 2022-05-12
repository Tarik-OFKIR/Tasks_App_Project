import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks_projet_innovation_front/services/notification_services.dart';
import 'package:tasks_projet_innovation_front/services/theme_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    notifyHelper=NotifyHelper();
    notifyHelper.initializeNotification(); 
    notifyHelper.requestIOSPermissions();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(children: [
        Row(
          children: [
            Column(
              children: [
                Text(DateTime.now().toString()),
              ],
            )
          ],
        )

      ],
      ),
    );
  }

  _appBar(){
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
            title: "Theme Changed",
            body: Get.isDarkMode?"Activated Light Theme":"Activated Dark Theme"
          );
        },
        child: Icon( Get.isDarkMode ?Icons.wb_sunny_outlined:Icons.nightlight_round,
        size: 20,
          color: Get.isDarkMode ? Colors.white:Colors.black ,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage(
            "images/profile.png"
          ),
        ),
        SizedBox(width: 20,)
      ],

    );
  }
  
}
