import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageGetx extends StatefulWidget {
  const HomePageGetx({super.key, required this.title});

  final String title;

  @override
  State<HomePageGetx> createState() => _HomePageGetxState();
}

class _HomePageGetxState extends State<HomePageGetx> {
  //get x variable for observe
  var _counter = 0.obs;

  void _incrementCounter() async {
    _counter++;

    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt("counter", _counter.value);
  }

  loadValues() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    _counter.value = sp.getInt("counter") ?? 0;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadValues();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var fontSize = screenWidth>600?30.0:20.0;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the HomePageGetx object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
            Obx(()=>Text(_counter.value.toString(),style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),))
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
