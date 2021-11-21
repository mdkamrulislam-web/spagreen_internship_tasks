import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String? documentID;
  String content;
  Timestamp createdOn;
  bool isDone;

  TodoModel({
    // required this.documentID,
    required this.content,
    required this.createdOn,
    required this.isDone,
  });
}
