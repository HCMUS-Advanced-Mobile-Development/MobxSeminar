import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simple_mobx/contact.dart';
import 'package:simple_mobx/counter.dart';
import 'package:simple_mobx/counter_gen.dart';
import 'package:simple_mobx/multi_widget_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Simple Observer Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final counter2 = Counter2();
  final counter1 = Counter();
  final contact = Contact();
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    widget.counter2.runReactionDisposer();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    widget.counter2.disposeReactionDisposer();
    // TODO: implement dispose
    super.dispose();
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
            const Expanded(
              child: Text(
                'You have pushed the button this many times:',
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) => Text(
                  '${widget.counter2.value}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      labelText: "First Name",
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      labelText: "Last Name",
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) => Text(
                  widget.contact.fullname,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(60, 5, 60, 5),
                child: SizedBox(
                  height: 20,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text("Next Demo"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MultiWidget()));
                    },
                  ),
                ),
              )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // widget.counter2.increment2();
          log("pressed");
          // widget.counter2.increment();
          widget.counter2.increment();
          widget.contact.firstName = firstNameController.value.text;
          widget.contact.lastName = lastNameController.value.text;
          // log(widget.counter2.temp.x.toString());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
