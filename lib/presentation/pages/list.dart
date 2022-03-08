import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> noList = [for (var i = 1; i <= 50; i++) i];

  Future<void> _loadData() async {
    await Future<void>.delayed(const Duration(seconds: 2));

    print('Loaded New Data');

    setState(() {
      final min = noList.first;
      noList.insert(0, min - 1);
      // final max = noList.last;
      // noList.add(max + 1);
      print('itemList:${noList.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ItemScrollController();
    final listener = ItemPositionsListener.create();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Load Data Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                print('Loading New Data');
                await _loadData();
                controller.jumpTo(index: 1);
              },
              //  child: ListView.builder(
              //    physics: const AlwaysScrollableScrollPhysics(),
              //    itemCount: noList.length,
              //    itemBuilder: (BuildContext context, int i) {
              //      return ListTile(
              //        title: Text('item ${noList[i]}'),
              //      );
              //    },
              //  ),
              child: ScrollablePositionedList.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemScrollController: controller,
                  itemPositionsListener: listener,
                  itemCount: noList.length,
                  itemBuilder: (BuildContext context, int i) {
                    return ListTile(
                      title: Text('item ${noList[i]}'),
                    );
                  }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadData,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
