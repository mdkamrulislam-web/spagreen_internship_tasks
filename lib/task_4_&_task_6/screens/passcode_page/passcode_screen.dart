import 'package:flutter/material.dart';
import 'package:animator/animator.dart';
import 'package:login_signup_page_flutter/task_4_&_task_6/const.dart' as cons;
import 'package:login_signup_page_flutter/task_4_&_task_6/models/display_data.dart';
import 'package:login_signup_page_flutter/task_4_&_task_6/widgets/background_widget.dart';
import 'package:login_signup_page_flutter/task_4_&_task_6/widgets/numpad_widget.dart';

class PasscodeScreen extends StatefulWidget {
  static const String id = "passcode_screen";
  final String? userPasscode;

  const PasscodeScreen({Key? key, @required this.userPasscode})
      : super(key: key);

  @override
  _PasscodeScreenState createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen>
    with SingleTickerProviderStateMixin {
  bool? isShowNumpad = false;
  late AnimationController logoController;
  late Animation<Offset> logoOffset;

  @override
  void initState() {
    super.initState();
    logoController = AnimationController(
      vsync: this,
      duration: const Duration(
        microseconds: 6000,
      ),
    );
    logoOffset = Tween<Offset>(
      begin: const Offset(0, 1.7),
      end: const Offset(0, -2),
    ).animate(
      CurvedAnimation(
        parent: logoController,
        curve: Curves.easeInOutExpo,
      ),
    );
  }

  Widget logoWidget() {
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            color: Colors.black26,
            offset: Offset(3.0, 3.0),
            spreadRadius: 1.0,
          )
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: doOnLogoTap,
          child: const Image(
            image: AssetImage(
              cons.cLogoImage,
            ),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  void doOnLogoTap() {
    isShowNumpad = !isShowNumpad!;
    setState(() {
      if (isShowNumpad!)
        logoController.forward();
      else {
        logoController.reverse();
      }
    });
  }

  @override
  void dispose() {
    logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DisplayData().init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            BackgroundWidget(
              isBlur: isShowNumpad!,
            ),
            Center(
              child: SlideTransition(
                position: logoOffset,
                child: logoWidget(),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: displayWidth()! * 0.30,
                ),
                Container(
                  width: displayWidth()! * 0.8,
                  child: NumpadWidget(onNumpadTap: null),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
