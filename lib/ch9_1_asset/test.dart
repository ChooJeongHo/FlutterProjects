import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Future<String> useRootBundle() async {
    return await rootBundle.loadString('assets/text/my_text.txt');
  } // rootBundle
  Future<String> useDefaultAssetBundle(BuildContext context) async {
    return await DefaultAssetBundle.of(context).loadString('assets/text/my_text.txt');
  } // DefaultAssetBundle

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Test'),
          ),
          body: Column(
            children: [
              Image.asset('images/icon.jpg'),
              Image.asset('images/icon/user.png'),
              FutureBuilder(
                  future: useRootBundle(),
                  builder: (context, snapshot){
                    return Text('rootBundle : ${snapshot.data}'); // 화면에 출력
                  }
              ),
              FutureBuilder(
                  future: useDefaultAssetBundle(context),
                  builder: (context, snapshot){
                    return Text('DefaultAssetBundle : ${snapshot.data}'); // 화면에 출력
                  }
              )
            ],
          )),
    );
  }
}
