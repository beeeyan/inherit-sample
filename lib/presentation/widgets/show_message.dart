

import 'package:flutter/material.dart';
import 'package:inherited_sample/domain/message_data.dart';

class ShowMessage extends StatelessWidget {
  const ShowMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message =
      context.dependOnInheritedWidgetOfExactType<MessageData>()!.message;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Text(message),
    );
  }
}
