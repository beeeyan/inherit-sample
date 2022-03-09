

import 'package:flutter/material.dart';

class MessageData extends InheritedWidget {
  const MessageData({Key? key, required Widget child})
  : super(key: key, child: child);

  // InheritedWidgetのプロパティは変更不可能
  String get message => '共通のメッセージ';

  // 更新を伝搬させるか否かの制御
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
