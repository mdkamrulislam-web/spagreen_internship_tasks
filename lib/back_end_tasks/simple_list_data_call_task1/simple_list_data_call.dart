import 'package:flutter/material.dart';
import 'package:login_signup_page_flutter/back_end_tasks/simple_list_data_call_task1/list.dart';

class SimpleListDataCall extends StatefulWidget {
  static const String id = "simple_list_data_call";
  const SimpleListDataCall({Key? key}) : super(key: key);

  @override
  _SimpleListDataCallState createState() => _SimpleListDataCallState();
}

class _SimpleListDataCallState extends State<SimpleListDataCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("${foodImages[index]}"),
                      )),
                      height: MediaQuery.of(context).size.height / 3,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: Colors.grey.shade300,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${foods[index]}',
                              style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                            icons[index],
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
