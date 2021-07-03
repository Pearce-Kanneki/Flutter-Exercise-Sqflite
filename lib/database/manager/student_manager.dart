import 'package:sqflite_example/database/data/student.dart';
import 'package:sqflite_example/database/database_helper.dart';

class StudentManager {
  final dbHelper = DatabaseHelper.instance;

  // Singleton
  StudentManager._privateConstructor();

  static final StudentManager instance = StudentManager._privateConstructor();

  /* 插入資料 */
  void inster() async {
    var student = Student(name: "Kinght", score: 80, id: null);

    dbHelper.insert(student.toMap());
    print("--- insert 執行結束---");
  }

  /* 查詢資料 */
  void query() async {
    final rows = await dbHelper.queryAllRows();
    print("查詢結果：");
    rows.forEach((element) => print(element));
    print("--- query 執行結束---");
  }

  /* 更新資料 */
  void update() async {
    var student = Student(id: 1, name: "Hello", score: 100);
    dbHelper.update(student.toMap());
    print("--- update 執行結束---");
  }

  /* 刪除資料 */
  void delete() async {
    final id = await dbHelper.queryRowCount();
    dbHelper.delete(id!);
    print("--- delete 執行結束---");

  }

}
