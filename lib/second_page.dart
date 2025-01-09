import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final int counter;
  const SecondPage({super.key, required this.counter});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    Widget child = Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );

    child = PopScope(
      canPop: canBack(),
      onPopInvoked: (bool didPop) {
        print('SecondPage onPopInvoked: $didPop');
      },
      child: child,
    );

    return child;
  }

  Future<bool> canBackByFuture() async {
    bool result = widget.counter % 2 == 1;
    debugPrint('SecondPage counter: ${widget.counter} result=$result');
    return result;
  }

  bool canBack() {
    bool result = widget.counter % 2 == 1;
    debugPrint('SecondPage counter: ${widget.counter} result=$result');
    return result;
  }
}
