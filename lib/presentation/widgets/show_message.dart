

import 'package:flutter/material.dart';
import 'package:inherited_sample/domain/message_data.dart';

class ShowMessage extends StatelessWidget {
  const ShowMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // InheritedWidgetで作成したMessageDataから値を取得する。
    final message =
      context.dependOnInheritedWidgetOfExactType<MessageData>()!.message;

    return Text(
      message,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
