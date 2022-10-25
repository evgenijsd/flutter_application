// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: const MyFormPage(
            title: 'Form'), //const MyHomePage(title: 'Flutter Demo Home Page'),
        title: const Text(
          'SplashScreen',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue[200],
      ),
    );
  }
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key, required this.title});

  final String title;

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: Colors.black);
  final _sizeTextWhite = const TextStyle(fontSize: 20.0, color: Colors.white);
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 400.0,
            child: TextFormField(
              decoration: const InputDecoration(labelText: "Login"),
              keyboardType: TextInputType.emailAddress,
              style: _sizeTextBlack,
            ),
          ),
          Container(
            width: 400.0,
            padding: const EdgeInsets.only(top: 10.0),
            child: TextFormField(
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
              style: _sizeTextBlack,
            ),
          ),
          SizedBox(
            height: 50.0,
            child: Row(
              children: <Widget>[
                Theme(
                  data: ThemeData(
                      unselectedWidgetColor:
                          const Color.fromARGB(255, 197, 182, 94)),
                  child: Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value!;
                      });
                    },
                  ),
                ),
                const Text(
                  'Запам\'ятати',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 101, 94, 199)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: MaterialButton(
              color: Theme.of(context).colorScheme.secondary,
              height: 50.0,
              minWidth: 150.0,
              onPressed: () {},
              child: Text(
                "Далі",
                style: _sizeTextWhite,
              ),
            ),
          )
        ],
      )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
            const Text(
              'Hello World',
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
      ),
    );
  }
}
