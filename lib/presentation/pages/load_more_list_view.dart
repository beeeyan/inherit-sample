import 'package:flutter/material.dart';

class LoadMoreListView extends StatefulWidget {
  const LoadMoreListView({Key? key, this.enableLoadMore = true, this.count = 15}) : super(key: key);
  
  final bool enableLoadMore;
  final int count;

  @override
  LoadMoreListViewState createState() {
    return LoadMoreListViewState();
  }

}

class LoadMoreListViewState extends State<LoadMoreListView> {

  final _scrollController = ScrollController();
  var isRequesting = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ///load more when the listView attached the bottom
        loadMore();
      }
    });
  }

  Future<void> loadMore() async {
    if (isRequesting) {
      ///if is requesting ,return the next action
      return;
    }
    setState(() {
      isRequesting = true;
    });

    ///loading your data from any where,eg:network
    return;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        reverse: true,
        itemCount: _count(),
        itemBuilder: _buildItem);
  }

  _count() {
    if (widget.enableLoadMore) {
      return widget.count + 1;
    }
    return widget.count;
  }

  Widget _buildItem(BuildContext context, int index) {
    if (index == widget.count) {
      return _buildLoadMoreView();
    }
    return Container(
      height: 36.0,
      child: Center(
        child: Text("I am the $index item"),
      ),
    );
  }

  Widget _buildLoadMoreView() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: 1.0,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}