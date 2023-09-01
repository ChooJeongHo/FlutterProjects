import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Channel',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NativeCallWidget(),
    );
  }
}

class NativeCallWidget extends StatefulWidget {
  @override
  NativeCallWidgetState createState() {
    return NativeCallWidgetState();
  }
}

class NativeCallWidgetState extends State<NativeCallWidget> {
  String? resultMessage;
  String? receiveMessage;

  Future<Null> nativeCall() async {
    const channel = BasicMessageChannel<String>('myMessageChannel', StringCodec());
    String? result = await channel.send('Hello from Dart');
    setState(() {
      resultMessage = result;
    });
    channel.setMessageHandler((String? message) async {
      setState(() {
        receiveMessage = message;
      });
      return 'Reply from Dart';
    });
  }

  // 화면을 그리는 부분
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Message Channel")),
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: (<Widget>[
              Text('resultMessage : $resultMessage', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
              Text('receiveMessage : $receiveMessage', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
              ElevatedButton(
                child: Text('native call'),
                onPressed: () {
                  nativeCall();
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
