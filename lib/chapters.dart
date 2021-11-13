import 'package:flutter/material.dart';
import 'package:login_signup_page_flutter/design_tasks.dart';

class ChapterList extends StatelessWidget {
  static const String id = "chapter_screen";
  const ChapterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Chapters',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, DesignTasks.id);
              },
              child: Text(
                'Design',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Back-end',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
