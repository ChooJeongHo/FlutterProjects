import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,  // 디버그 배너 제거
        theme: ThemeData(
          primarySwatch: Colors.pink,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.orange, // 앱바 배경색
            foregroundColor: Colors.black,  // 아이콘, 텍스트 색상
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Test'),
          ),
          body: Center(
            child: Column(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Button')),
                Checkbox(value: true, onChanged: (value) {}),
                Text('HelloWorld'),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton( // 플로팅 액션 버튼
            child: Icon(Icons.add),
            onPressed: () {},
          ),
        )
    );
  }
}
