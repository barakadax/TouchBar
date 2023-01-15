import 'package:flutter/material.dart';
import 'package:shell/shell.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  KeyboardUi createState() => KeyboardUi();
}

class KeyboardUi extends State<HomePage> {
  var command = Shell();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        color: const Color.fromRGBO(38, 38, 38, 1.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List<InkWell>.generate(
            10,
            (e) => InkWell(
              child: Container(
                width: 200,
                height: 100,
                margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffffffff),
                  ),
                  color: const Color(0xff202020),
                ),
                child: Center(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          "icons/chrome.png",
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "chrome",
                          style: TextStyle(
                            color: Color(0xffF2F2F2),
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () async {
                await command.run("/usr/bin/google-chrome");
              },
            ),
          ),
        ),
      ),
    );
  }
}
