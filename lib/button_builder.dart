import 'package:flutter/material.dart';
import 'package:shell/shell.dart';

class ButtonBuilder {
  InkWell build(dynamic buttonData) {
    return InkWell(
      splashColor: const Color(0xffff8c00), // Doesn't work
      child: Container(
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
        decoration: BoxDecoration(
          color: const Color(0xff202020),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: const Color(0xffffffff)),
        ),
        child: Row(
          children: <Widget>[
            Image.asset("icons/chrome.png"),
            const SizedBox(width: 5),
            Text(
              buttonData["text"],
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
        await command.run(buttonData["command"]);
      },
      onHover: (isHovering) async {}, // add hover animation
      onLongPress: () async {}, // change order of elements
    );
  }
}
