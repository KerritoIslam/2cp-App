import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class NotificationsSettingsTile extends StatefulWidget {
  final String name;
  final VoidCallback  cb;
  final bool val;
  const NotificationsSettingsTile({super.key, required this.name, required this.cb, required this.val});

  @override
  State<NotificationsSettingsTile> createState() => _NotificationsSettingsTileState();
}

class _NotificationsSettingsTileState extends State<NotificationsSettingsTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.name),
        FSwitch(
          value: widget.val,
          onChange: (value) {
            widget.cb();
          },
        ),
      ],
    );
  }
}
