import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/constants/firebase_auth_constants.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/models/data_model/todo_model.dart';

class FirestoreDB {
  static addUser(String email) async {
    await firebaseFirestore.collection('users').doc(auth.currentUser!.uid).set({
      'email': email,
      'createdOn': Timestamp.now(),
    });
  }

  static addTodo(TodoModel todoModel) async {
    await firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('todos')
        .add({
      'content': todoModel.content,
      'isDone': todoModel.isDone,
      'createdOn': Timestamp.now(),
    });
  }
}
