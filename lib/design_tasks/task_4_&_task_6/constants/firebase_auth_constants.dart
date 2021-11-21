import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/controllers/auth_controller.dart';

final Future<FirebaseApp> firebaseInitilization = Firebase.initializeApp();

FirebaseAuth auth = FirebaseAuth.instance;

AuthController authController = AuthController.instance;

GoogleSignIn googleSignIn = GoogleSignIn();

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
