import 'package:flutter/material.dart';
import 'add_task_button.dart';

class TodoListPage extends StatefulWidget {
  final String title; // 受け取る変数
  // コンストラクタ
  // myappから受け取る
  const TodoListPage({super.key, required this.title});

  @override
  _ToDoListPagesState createState() => _ToDoListPagesState();
}

class _ToDoListPagesState extends State<TodoListPage> {
  List<String> tasks = [];
  List<bool> checkbox = [];

  void addTask() {
    setState(() {
      tasks.add('ここに入力');
      checkbox.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView.builder(
        itemCount: tasks.length * 2,
        itemBuilder: (context, index) {
          if(index.isOdd){
            return const Divider(
              height: 0,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            );
          }
          int taskIndex = index ~/ 2;
          return ListTile(
            // チェックボックスと入力欄
            title: Row(
              children: [
                Checkbox(
                  value: checkbox[taskIndex],
                  onChanged: (bool? value) {
                    setState(() {
                      checkbox[index] = value ?? false;
                    });
                  },
                ),
                Text(
                  tasks[taskIndex],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: AddTaskButton(
        onPressed: addTask,
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: Text(widget.title),
      centerTitle: true, // タイトルを中央に配置
    );
  }
}
