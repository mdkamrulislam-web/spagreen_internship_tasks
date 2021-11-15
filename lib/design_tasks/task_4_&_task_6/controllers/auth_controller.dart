import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/constants/firebase_auth_constants.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/screens/home_screen.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/screens/login_page/login_screen.dart';
// import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/screens/signup_page/signup_screen.dart';

class AuthController extends GetxController {
  late Rx<User?> firebaseUser;
  static AuthController instance = Get.find<AuthController>();

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);

    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginScreen());
      // SignupScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}
