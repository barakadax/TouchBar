import 'package:flutter/material.dart';

import 'microphone_button.dart';
import 'speaker_button.dart';

class ButtonBuilder {
  var defaultMargin = const EdgeInsets.fromLTRB(5, 0, 5, 0);
  var defaultPadding = const EdgeInsets.fromLTRB(12, 5, 12, 5);
  var defaultDecoration = BoxDecoration(
    color: const Color(0xff202020),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    border: Border.all(color: const Color(0xffffffff)),
  );

  InkWell? build(dynamic buttonData) {
    List<Widget>? buttonContent;

    if (buttonData["command"] == null) {
      return null;
    }

    if (buttonData["text"] != null || buttonData["icon"] != null) {
      buttonContent = getButtonFront(buttonData);
    } else if (buttonData["type"] == "microphone") {
      buttonContent = getMicrophoneButton();
    } else if (buttonData["type"] == "speaker") {
      buttonContent = getSpeakerButton();
    } else {
      return null;
    }

    return InkWell(
      child: Container(
        margin: defaultMargin,
        padding: defaultPadding,
        decoration: defaultDecoration,
        child: Row(children: buttonContent),
      ),
      onTap: () async {}, // send to file stream / serialize a command
      onHover: (isHovering) async {}, // add hover animation
      onLongPress: () async {}, // change order of elements
    );
  }

  List<Widget> getButtonFront(dynamic buttonData) {
    var widgets = <Widget>[];

    if (buttonData["text"] != null) {
      widgets.add(Text(
        buttonData["text"]!,
        maxLines: 1,
        style: const TextStyle(
          color: Color(0xffF2F2F2),
          fontSize: 25,
        ),
        textAlign: TextAlign.left,
      ));
    }

    if (buttonData["text"] != null && buttonData["icon"] != null) {
      widgets.add(const SizedBox(width: 5));
    }

    if (buttonData["icon"] != null) {
      widgets.add(Image.asset("icons/chrome.png"));
    }

    if (buttonData["flipped"] != null && buttonData["flipped"]) {
      return widgets.reversed.toList();
    }

    return widgets;
  }

  List<Widget> getMicrophoneButton() {
    return <Widget>[const MicrophoneButton()];
  }

  List<Widget> getSpeakerButton() {
    return <Widget>[const SpeakerButton()];
  }
}
