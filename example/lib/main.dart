import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:unique_identifier/unique_identifier.dart';

void main() {
  print("main1========");
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _identifier = 'Unknown';

  @override
  void initState() {
    print("object1=============");
    super.initState();
    initUniqueIdentifierState();
    print("object4=============");
  }

  Future<void> initUniqueIdentifierState() async {
    print("object2=============");

    String identifier;
    try {
      identifier = (await UniqueIdentifier.serial)!;
    } on PlatformException {
      identifier = 'Failed to get Unique Identifier';
    }

    if (!mounted) return;

    setState(() {
      _identifier = identifier;
    });
    print("object3=============");
  }

  @override
  Widget build(BuildContext context) {
    print("object5=============");

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: new Center(
          child: new Text('Running on device with id: $_identifier\n'),
        ),
      ),
    );
  }
}
