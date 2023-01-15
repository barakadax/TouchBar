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
                height: 100,
                margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                decoration: BoxDecoration(
                  color: const Color(0xff202020),
                  border: Border.all(
                    color: const Color(0xffffffff),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Image.asset("icons/chrome.png"),
                    const FittedBox(
                      fit: BoxFit.fitHeight, // doesn't work
                      child: Text(
                        "chrome",
                        maxLines: 1,
                        style: TextStyle(
                          color: Color(0xffF2F2F2),
                        ),
                      ),
                    ),
                  ],
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
