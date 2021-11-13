import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:login_signup_page_flutter/task_4_&_task_6/const.dart' as cons;

class BackgroundWidget extends StatelessWidget {
  final bool isBlur;

  const BackgroundWidget({Key? key, required this.isBlur}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(cons.cBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: (isBlur)
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.1),
                ),
              )
            : null,
      ),
    );
  }
}
