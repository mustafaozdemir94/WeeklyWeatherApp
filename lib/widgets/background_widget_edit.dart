import 'package:flutter/material.dart';

class BackgroundWidgetEdit extends StatefulWidget {
  const BackgroundWidgetEdit({super.key});

  @override
  _BackgroundWidgetEditState createState() => _BackgroundWidgetEditState();
}

class _BackgroundWidgetEditState extends State<BackgroundWidgetEdit> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: const Column(
        children: [Text("data")],
      ),
    );
  }
}
