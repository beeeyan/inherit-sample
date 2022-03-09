

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

  // 慣習としてstatic メソッドの「of」を実装する。
  // BuildContext.dependOnInheritedWidgetOfExactTypeを使わなくていいように
  static MessageData of(BuildContext context) =>
    context.dependOnInheritedWidgetOfExactType<MessageData>()!;
}
