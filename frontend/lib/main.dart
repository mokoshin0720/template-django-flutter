import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/provider.dart';
import 'package:frontend/view_model.dart';

import 'data/count_data.dart';

void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(ViewModel()),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  final ViewModel viewModel;
  MyHomePage(
    this.viewModel, {
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  late ViewModel _viewModel;

  @override
  void initState() {
    super.initState();

    _viewModel = widget.viewModel;
    _viewModel.setRef(ref);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            ref.watch(titleProvider),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(ref.watch(messageProvider)),
              Text(
                _viewModel.count,
                style: Theme.of(context).textTheme.headline4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () => _viewModel.onIncrease(),
                    child: Icon(CupertinoIcons.plus),
                  ),
                  FloatingActionButton(
                    onPressed: () => _viewModel.onDecrease(),
                    child: Icon(CupertinoIcons.minus),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(_viewModel.countUp),
                  Text(_viewModel.countDown),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _viewModel.onReset(),
          child: Icon(CupertinoIcons.refresh),
        ));
  }
}
