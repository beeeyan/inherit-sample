
import 'package:flutter/material.dart';
import 'package:inherited_sample/domain/message_data.dart';
import 'package:inherited_sample/presentation/widgets/show_count.dart';
import 'package:inherited_sample/presentation/widgets/show_message.dart';

class InheritedBPage extends StatelessWidget {
  const InheritedBPage({Key? key}) : super(key: key);

  @override
   Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('InheritedWidgetをつかった場合'),
        ),
        body: Center(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              MessageData(child: ShowMessage(),),
              ShowCount(),
            ],
          ),
        ),
      );
  }
}
