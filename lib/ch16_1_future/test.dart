import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<int> sum() {
    return Future<int>(() {
      var sum = 0;
      for (int i = 0; i < 500000000; i++) {
        sum += i;
      }
      return sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: FutureBuilder(
          future: sum(),    // 미래에 발생할 데이터
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Text('${snapshot.data}', style: TextStyle(color: Colors.black, fontSize: 30),),
              );
            }
            return Center(
              child: Text(
                'waiting',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            );
          },
        ),
      ),
    );
  }
}
