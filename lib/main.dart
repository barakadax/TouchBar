import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'button_builder.dart';
import 'json_reader.dart';

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
// get and load icons for buttons in runtime
// create asymmetry public key to crypt json from other device and use only here per each json change
class KeyboardUi extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        color: const Color.fromRGBO(38, 38, 38, 1.0),
        child: FutureBuilder(
            future: getButtonsList(),
            builder:
                (BuildContext context, AsyncSnapshot<List<InkWell>> snapshot) {
              List<InkWell> children;
              if (snapshot.hasData) {
                children = snapshot.data!;
              } else if (snapshot.hasError) {
                children = <InkWell>[
                  InkWell(child: Text('Error: ${snapshot.error}'))
                ];
              } else {
                children = <InkWell>[
                  const InkWell(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ];
              }
              return ListView(
                scrollDirection: Axis.horizontal,
                children: children,
              );
            }),
      ),
    );
  }
}

Future<List<InkWell>> getButtonsList() async {
  var jsonReader = JsonReader();
  var data = await jsonReader.readJson('example/example.json');

  var buttonCreator = ButtonBuilder();
  var buttonsList = <InkWell>[];

  for (var i = 0; i < (data as List<dynamic>).length; i -= -1) {
    buttonsList.add(buttonCreator.build(data[i]));
  }

  return buttonsList;
}
