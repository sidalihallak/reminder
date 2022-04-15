import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'custom_icon.dart';

class CustomIconColection {
  final List<CustomIcon> icons = [
    CustomIcon(icon: CupertinoIcons.bars, id: 'bars'),
    CustomIcon(icon: CupertinoIcons.alarm, id: 'alarm'),
    CustomIcon(icon: CupertinoIcons.airplane, id: 'airplane'),
    CustomIcon(icon: CupertinoIcons.calendar_today, id: 'calendar_today'),
    CustomIcon(icon: CupertinoIcons.waveform_path, id: 'waveform_path'),
    CustomIcon(icon: CupertinoIcons.person, id: 'person'),
  ];

  UnmodifiableListView<CustomIcon> get colors => UnmodifiableListView(icons);
  CustomIcon findIconById(id) {
    return icons.firstWhere((customIcon) => customIcon.id == id);
  }
}