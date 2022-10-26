// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
        navigateAfterSeconds: const MyFormPage(title: 'Form'),
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

getdata() async {}

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key, required this.title});

  final String title;

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: Colors.black);
  final _sizeTextWhite = const TextStyle(fontSize: 20.0, color: Colors.white);
  final _errorText = const TextStyle(color: Colors.red);
  bool _rememberMe = false;
  static const loginKey = 'login';
  static const passwordKey = 'password';
  static const rememberKey = 'remember';
  String _login = '';
  String _password = '';
  String _error = '';

  @override
  void initState() {
    super.initState();
    _initLogin();
  }

  Future _initLogin() async {
    await _getLogin();
  }

  Future _setLogin() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(loginKey, _login);
    prefs.setString(passwordKey, _password);
    prefs.setBool(rememberKey, _rememberMe);
  }

  Future _getLogin() async {
    var prefs = await SharedPreferences.getInstance();
    _login = prefs.getString(loginKey) ?? '';
    _password = prefs.getString(passwordKey) ?? '';
    _rememberMe = prefs.getBool(rememberKey) ?? false;
    if (_login == "admin" && _password == "123456" && _rememberMe) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MyHomePage(title: 'Second Page')));
    }
  }

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
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: SizedBox(
              width: 400.0,
              child: TextFormField(
                decoration: const InputDecoration(labelText: "Login"),
                keyboardType: TextInputType.emailAddress,
                style: _sizeTextBlack,
                onChanged: (text) {
                  setState(() {
                    _login = text;
                  });
                },
              ),
            ),
          ),
          Container(
            width: 400.0,
            padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
            child: TextFormField(
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
              style: _sizeTextBlack,
              onChanged: (text) {
                setState(() {
                  _password = text;
                });
              },
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
              onPressed: () {
                if (_login.compareTo("admin") == 0 &&
                    _password.compareTo("123456") == 0) {
                  setState(() {
                    _error = '';
                  });
                  _setLogin();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MyHomePage(title: 'Second Page')));
                } else {
                  setState(() {
                    _error = 'Невірний логін';
                  });
                }
              },
              child: Text(
                "Далі",
                style: _sizeTextWhite,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 50.0,
              child: Text(
                _error,
                style: _errorText,
              ),
            ),
          ),
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
            Text(
              'Вітаю',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
