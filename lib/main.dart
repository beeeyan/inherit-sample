import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inherited_sample/domain/count_manager.dart';
import 'package:inherited_sample/presentation/pages/inherited_a.dart';
import 'package:inherited_sample/presentation/pages/inherited_b.dart';
import 'package:inherited_sample/presentation/pages/list.dart';

void main() {
  runApp(const CountManeger(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final _router = GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
          const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      GoRoute(
        path: '/listpage',
        builder: (context, state) => const ListPage(),
      ),
      GoRoute(
        path: '/inherited/a',
        builder: (context, state) =>
          const InheritedAPage(),
      ),
      GoRoute(
        path: '/inherited/b',
        builder: (context, state) =>
          const InheritedBPage(),
      )
    ]);

    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: ElevatedButton(
                child: const Text('Aページ'),
                onPressed: () => context.push('/inherited/a'),
            ),),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: ElevatedButton(
                child: const Text('Bページ'),
                onPressed: () => context.push('/inherited/b'),
            ),),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
