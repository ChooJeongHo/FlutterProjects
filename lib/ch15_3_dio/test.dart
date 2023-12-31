import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String result = '';

  dioTest() async {
    try {
      var dio = Dio(BaseOptions(
        baseUrl: "https://reqres.in/api/",
        connectTimeout: 5000,
        receiveTimeout: 5000,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json'
        },
      ));

      List<Response<dynamic>> response = await Future.wait([  // 모든 응답이 완료될 때까지 기다림
        dio.get('https://reqres.in/api/users?page=1'),
        dio.get('https://reqres.in/api/users?page=2')
      ]);
      response.forEach((element) {            // 마지막 데이터만 출력
        if (element.statusCode == 200) {
          setState(() {
            result = element.data.toString();
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$result'),
              ElevatedButton(
                onPressed: dioTest,
                child: Text('Get Server Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
