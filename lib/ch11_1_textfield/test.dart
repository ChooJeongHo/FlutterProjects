import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Test'),
            ),
            body: TestScreen()
        )
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  TextState createState() => TextState();
}

class TextState extends State<TestScreen> {

  final controller = TextEditingController();
  int textCounter = 0;

  _printValue() {
    print("_printValue(): ${controller.text}");
    setState(() {
      textCounter = controller.text.length;
    });
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_printValue);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build....");
    return Column(
      children: [
        Text('TextField Test'),
        TextField(
          style: TextStyle(fontSize: 15.0),
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Data',
            prefixIcon: Icon(Icons.input),
            border: OutlineInputBorder(),
            hintText: "Hint Text",
            helperText: "데이터를 입력하세요..",
            counterText: "$textCounter characters",
          ),
          textInputAction: TextInputAction.search,  // 키보드의 완료 버튼을 검색으로 변경
          keyboardType: TextInputType.emailAddress, // 키보드의 입력 형식을 이메일 주소로 변경
          minLines: 5,
          maxLines: 5,
        ),
      ],
    );
  }
}