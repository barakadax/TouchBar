import 'package:flutter/material.dart';

class MicrophoneButton extends StatefulWidget {
  const MicrophoneButton({super.key});

  @override
  MicrophoneButtonState createState() => MicrophoneButtonState();
}

class MicrophoneButtonState extends State<MicrophoneButton> {
  bool _isMicOn = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        _isMicOn ? Icons.mic_sharp : Icons.mic_off_sharp,
        color: const Color(0xffffffff),
        size: 35,
      ),
      onTap: () {
        setState(() {
          _isMicOn = !_isMicOn;
        });
      },
    );
  }
}
