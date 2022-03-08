
import 'package:flutter/material.dart';

// InheritedWidgetはStateを保持するだけの役。
class _StateContainer extends InheritedWidget {
  const _StateContainer({Key? key, required Widget child, required this.data})
  : super(key: key, child: child);

  // CountManagerStateのインスタンスを保持し、下層に流す
  final CountManagerState data;

  @override
  bool updateShouldNotify(_StateContainer oldWidget) {
    return true;
  }

}

// 状態管理用Widget
class CountManeger extends StatefulWidget {
  const CountManeger({Key? key, required this.child}) : super(key: key);

  final Widget child;

  // ofメソッドはStatefulWidgetがもつ
  // ofにlisten引数を追加。デフォルトはtrue
  static CountManagerState of(BuildContext context, {bool listen = true}) =>
    listen
      ? context.dependOnInheritedWidgetOfExactType<_StateContainer>()!.data
      // listen == falseの場合、このcontextが更新の対象にならないように
      : (context
              .getElementForInheritedWidgetOfExactType<_StateContainer>()!
              .widget as _StateContainer)
            .data;

  @override
  CountManagerState createState() => CountManagerState();

}

class CountManagerState extends State<CountManeger> {
  // 下層からアクセスしたいプロパティです。
  int count = 0;

  // 下層からアクセスしたい状態更新用メソッド
  void increment() {
    setState((){
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _StateContainer(
      // InheritedWidgetのdataに、このStateインスタンス自体を渡す。
      data: this,
      child: widget.child,
    );
  }

}
