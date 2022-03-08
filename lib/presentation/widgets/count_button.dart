

import 'package:flutter/material.dart';
import 'package:inherited_sample/domain/count_manager.dart';

class CountButton extends StatelessWidget {
  const CountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('increment'),
      onPressed: () {
        // ofメソッドでCountManegerの状態更新メソッドにアクセス
        // ボタンをリビルドする必要はないので、listen:falseとする。
        CountManeger.of(context, listen: false).increment();
      },
    );
  }
}
