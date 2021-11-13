import 'package:flutter/material.dart';
import 'package:login_signup_page_flutter/back_end_tasks/back_end_tasks_contents.dart';
import 'package:login_signup_page_flutter/design_tasks/design_tasks.dart';

class ChapterList extends StatelessWidget {
  static const String id = "chapter_screen";
  const ChapterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              'Chapters',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, DesignTasks.id);
              },
              child: Text(
                'Design',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, BackEndTasks.id);
              },
              child: Text(
                'Back-end',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
