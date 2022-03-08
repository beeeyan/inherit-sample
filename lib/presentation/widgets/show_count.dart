
import 'package:flutter/material.dart';
import 'package:inherited_sample/domain/count_manager.dart';

class ShowCount extends StatelessWidget {
  const ShowCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = CountManeger.of(context).count;
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        '$count',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
  
}