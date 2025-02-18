import 'package:flutter/material.dart';
import 'add_task_button.dart';

class TodoListPage extends StatefulWidget {
  final String title;

  const TodoListPage({super.key, required this.title});

  @override
  _ToDoListPagesState createState() => _ToDoListPagesState();
}

class _ToDoListPagesState extends State<TodoListPage> {
  List<String> tasks = [];
  List<bool> checkbox = [];

  void addTask() {
    setState(() {
      tasks.add('');
      checkbox.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView.builder(
        itemCount: tasks.length,  // タスクの数だけ表示
        itemBuilder: (context, index) {
          return ListTile(
            // 縦並び用
            title: Row(
              children: [
                Checkbox(
                  value: checkbox[index],
                  onChanged: (bool? value) {
                    setState(() {checkbox[index] = value ?? false;});
                  },
                ),
                Expanded(
                  child: TextField(
                    textDirection: TextDirection.ltr, // 文字の入力方向を左から右に設定
                    controller: TextEditingController(text: tasks[index]),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {tasks[index] = value;});
                    },
                  ),
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
      centerTitle: true,
    );
  }
}
