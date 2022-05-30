import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:tasks_projet_innovation_front/ui/notified_page.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../models/task.dart';

class NotifyHelper {
  FlutterLocalNotificationsPlugin
  flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();



  initializeNotification() async {
    _confiureLocalTimeZone();
 final IOSInitializationSettings initializationSettingsIOS =
     IOSInitializationSettings(
         requestSoundPermission: false,
         requestBadgePermission: false,
         requestAlertPermission: false,
         onDidReceiveLocalNotification: onDidReceiveLocalNotification
     );


 final AndroidInitializationSettings initializationSettingsAndroid =
     AndroidInitializationSettings("appicon");

    final InitializationSettings initializationSettings =
        InitializationSettings(
       iOS: initializationSettingsIOS,
       android:initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onSelectNotification: selectNotification);

  }

  displayNotification({required String title, required String body}) async {
    print("doing test");
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        '1', 'name',
        importance: Importance.max, priority: Priority.high);

    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: title,
    );
  }
  scheduledNotification(int hour, int minute, TaskModel task) async {

     await flutterLocalNotificationsPlugin.zonedSchedule(
         task.id!.toInt(),
         task.title,
         task.note,
         _convertTime(hour, minute),
        // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
         const NotificationDetails(
             android: AndroidNotificationDetails('your channel id',
                 'your channel name')),
         androidAllowWhileIdle: true,
         uiLocalNotificationDateInterpretation:
             UILocalNotificationDateInterpretation.absoluteTime,
       matchDateTimeComponents: DateTimeComponents.time,
       payload: "${task.title}|"+"${task.note}|",
     );

   }

   tz.TZDateTime _convertTime(int hour, int minute){
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if(scheduleDate.isBefore(now)){
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
    
   }

   Future<void> _confiureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timezone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timezone));
   }

  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }


  Future selectNotification(String? payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    } else {
      print("Notification Done");
    }

    if(payload=="Theme Changed"){
      print("Nothing to naviaget");
    }else{
      Get.to(()=>NotifiedPage(label:payload));
    }


  }

  Future onDidReceiveLocalNotification(
      int id, String ?title, String? body, String? payload) async {
  print(body);
  }

  
}