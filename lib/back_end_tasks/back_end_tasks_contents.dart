import 'package:flutter/material.dart';
import 'package:login_signup_page_flutter/back_end_tasks/simple_list_data_call_task1/simple_list_data_call.dart';

class BackEndTasks extends StatefulWidget {
  const BackEndTasks({Key? key}) : super(key: key);
  static const String id = "back_end_content_screen";
  @override
  _BackEndTasksState createState() => _BackEndTasksState();
}

class _BackEndTasksState extends State<BackEndTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tasks",
                  style: Theme.of(context).textTheme.headline2!,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SimpleListDataCall.id);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Task - 1: Simple List Data Call",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
