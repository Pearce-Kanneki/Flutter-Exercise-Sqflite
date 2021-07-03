import 'package:flutter/material.dart';
import 'package:sqflite_example/database/manager/student_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sqflite"),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text(
              "新增",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              StudentManager.instance.inster();
            },
          ),
          ElevatedButton(
            child: Text(
              "查詢",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              StudentManager.instance.query();
            },
          ),
          ElevatedButton(
            child: Text(
              "修改",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              StudentManager.instance.update();
            },
          ),
          ElevatedButton(
            child: Text(
              "刪除",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              StudentManager.instance.delete();
            },
          ),
        ],
      ),
    );
  }
}
