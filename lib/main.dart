import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:login_signup_page_flutter/back_end_tasks/back_end_tasks_contents.dart';
import 'package:login_signup_page_flutter/back_end_tasks/simple_list_data_call_task1/simple_list_data_call.dart';
import 'package:login_signup_page_flutter/chapters.dart';
import 'package:login_signup_page_flutter/design_tasks/design_tasks.dart';
import 'package:login_signup_page_flutter/design_tasks/task_1_card_design/cards_list.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/controllers/auth_controller.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/screens/home_page/home_screen.dart';
import 'package:login_signup_page_flutter/design_tasks/task_1_card_design/restaurant_card_design.dart';
import 'package:login_signup_page_flutter/design_tasks/task_1_card_design/datamodels/restarunt_model.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/screens/login_page/login_screen.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/screens/passcode_page/passcode_screen.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/screens/signup_page/info_screen.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/screens/signup_page/signup_screen.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/screens/login_page/forgot_password_screen.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/screens/signup_page/terms_conditions_screen.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/screens/secure_code_page/secure_code_screen.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/screens/phone_number_page/phone_number_screen.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/theme/theme.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/l10n/locale_string.dart';
import 'design_tasks/task_4_&_task_6/constants/firebase_auth_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await firebaseInitilization.then((value) {
    Get.put(AuthController());
  });

  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: GetMaterialApp(
        // ! Theme Settings
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: currentTheme.currentTheme,

        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        // ChapterList.id,
        routes: {
          // ! Chapter Page
          ChapterList.id: (context) => const ChapterList(),

          // ! Design Tasks
          DesignTasks.id: (context) => const DesignTasks(),

          // ! Task 1 - Card Design
          CardsList.id: (context) => const CardsList(),
          RestaurantCard.id: (context) => RestaurantCard(
                size: MediaQuery.of(context).size,
                restaurantModel: restaurantModels[0],
              ),

          // ! Task 4
          LoginScreen.id: (context) => const LoginScreen(),
          ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
          SignupScreen.id: (context) => const SignupScreen(),
          InfoScreen.id: (context) => const InfoScreen(),
          TermsConditionsScreen.id: (context) => const TermsConditionsScreen(),
          PhoneNumberScreen.id: (context) => const PhoneNumberScreen(),
          SecureCodeScreen.id: (context) => const SecureCodeScreen(),
          PasscodeScreen.id: (context) =>
              const PasscodeScreen(userPasscode: '1234'),
          HomeScreen.id: (context) => const HomeScreen(),

          // ! Back-end Tasks
          BackEndTasks.id: (context) => const BackEndTasks(),

          // ! Task 1
          SimpleListDataCall.id: (context) => const SimpleListDataCall(),
        },

        title: 'Login Signup Demo',

        translations: LocaleString(),
        locale: const  Locale('en', 'US'),
      ),
    );
  }
}
