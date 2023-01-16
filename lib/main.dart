import 'package:flutter/material.dart';
import 'package:shell/shell.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  runApp(const MyApp());
  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setAsFrameless();
  });
}

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

// todo
// add idle animation and on press stop and return for buttons screen
// create more type of buttons (shutdown, volume control, brightness control, hdr)
// get and load icons for buttons in runtime
// read type of buttons, icon, text, icon+text from json
// create asymmetry public key to crypt json from other device and use only here per each json change
class KeyboardUi extends State<HomePage> {
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
                margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                decoration: BoxDecoration(
                  color: const Color(0xff202020),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                    color: const Color(0xffffffff),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Image.asset("icons/chrome.png"),
                    const SizedBox(width: 5),
                    Text(
                      "chrome $e", // create text in var and substring to 15 c
                      maxLines: 1,
                      style: const TextStyle(
                        color: Color(0xffF2F2F2),
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              onTap: () async {
                // add press animation
                var command = Shell();
                await command.run("/usr/bin/google-chrome");
              },
              onHover: (isHovering) async {}, // add hover animation
              onLongPress: () async {}, // change order of elements
            ),
          ),
        ),
      ),
    );
  }
}
