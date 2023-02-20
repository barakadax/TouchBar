import 'package:flutter/material.dart';

class SpeakerButton extends StatefulWidget {
  const SpeakerButton({super.key});

  @override
  SpeakerButtonState createState() => SpeakerButtonState();
}

class SpeakerButtonState extends State<SpeakerButton> {
  bool _isSpeakerOn = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        _isSpeakerOn ? Icons.volume_up : Icons.volume_mute_sharp,
        color: const Color(0xffffffff),
        size: 35,
      ),
      onTap: () {
        setState(() {
          _isSpeakerOn = !_isSpeakerOn;
        });
      },
    );
  }
}
