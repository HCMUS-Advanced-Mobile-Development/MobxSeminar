import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simple_mobx/counter.dart';

class MultiWidget extends StatefulWidget {
  final counter = Counter();
  @override
  MultiWidgetState createState() => MultiWidgetState();
}

class MultiWidgetState extends State<MultiWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Multi Observer Render"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Text(
                      'You have pushed the button this many times:',
                    ),
                  ),
                  Expanded(
                    child: Observer(
                      builder: (_) => Text(
                        '${widget.counter.value}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {  },
                    )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}