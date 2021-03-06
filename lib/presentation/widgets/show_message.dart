

import 'package:flutter/material.dart';
import 'package:inherited_sample/domain/message_data.dart';

class ShowMessage extends StatelessWidget {
  const ShowMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // InheritedWidgetを継承して作成したMessageDataから値を取得する。
    final message = MessageData.of(context).message;
    return Text(
      message,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
