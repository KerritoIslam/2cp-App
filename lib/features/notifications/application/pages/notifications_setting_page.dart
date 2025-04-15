
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forui/widgets/divider.dart';

class NotificationsSettingPage extends StatefulWidget {
  const NotificationsSettingPage({super.key});

  @override
  createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationsSettingPage> {
  // Define switch states
  Map<String, bool> switchValues = {
    "General Notification": true,
    "Sound": false,
    "Vibrate": true,
    "App updates": false,
    "Bill Reminder": true,
    "New Service Available": false,
    "New Tips Available": true,
  };

  void toggleSwitch(String setting) {
    setState(() {
      switchValues[setting] = !switchValues[setting]!;
    });
  }

  final List<Map<String, dynamic>> sections = [
    {
      "name": "Common",
      "settings": [
        "General Notification",
        "Sound",
        "Vibrate",
      ],
    },
    {
      "name": "System & services update",
      "settings": [
        "App updates",
        "Bill Reminder",
      ],
    },
    {
      "name": "Others",
      "settings": [
        "New Service Available",
        "New Tips Available",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,

        title: Text("Notifications",style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).secondaryHeaderColor
        ),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Theme.of(context).secondaryHeaderColor,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0.r),
        children: sections.map((section) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
             SizedBox(height: 40.h,) ,
              Text(
                section["name"],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ...section["settings"].map<Widget>((setting) {
                return SwitchListTile(
                  activeColor: Theme.of(context).primaryColor,
                  inactiveThumbColor:Theme.of(context).canvasColor ,
                  trackOutlineColor:WidgetStatePropertyAll(Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6)) ,
                  
                  title: Text(setting,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).secondaryHeaderColor
                  ),),
                  value: switchValues[setting]!,
                  onChanged: (bool value) {
                    toggleSwitch(setting);
                  },
                );
              }).toList(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 6.h),
                //TODO:change the thinkness of this
                child: Divider( thickness: 0.7,color: Theme.of(context).secondaryHeaderColor.withOpacity(0.8)),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

