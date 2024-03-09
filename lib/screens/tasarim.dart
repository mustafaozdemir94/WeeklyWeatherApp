import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tasarim extends StatefulWidget {
  const Tasarim({super.key});

  @override
  _TasarimState createState() => _TasarimState();
}

class _TasarimState extends State<Tasarim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        ),
        body: const Center(
          child: Column(
            children: [
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
            ],
          ),
        ));
  }
}
