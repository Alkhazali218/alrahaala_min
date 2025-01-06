import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/splash/Presentation/plash_view_body.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class splashView extends StatelessWidget {
 splashView({super.key});
 static String id = 'splashView';
 final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
   return const plashViewBody();
  }
}

class Arcpaint extends CustomPainter{
  @override
  // ignore: avoid_renaming_method_parameters, non_constant_identifier_names
  void paint (Canvas Canvas , Size sixe ) {
    Path orangeArc = Path()..moveTo(0, 0)..lineTo(0, sixe.height-175)..quadraticBezierTo(sixe.width/2, sixe.height, sixe.width, sixe.height-175)..lineTo(sixe.width,sixe.height)..lineTo(sixe.width, 0)..close();
  Canvas.drawPath(orangeArc, Paint()..color = kpColor);
  // for white arc
   Path whiteArc = Path()..moveTo(0, 0)..lineTo(0, sixe.height-180)..quadraticBezierTo(sixe.width/2, sixe.height-60, sixe.width, sixe.height-180)..lineTo(sixe.width,sixe.height)..lineTo(sixe.width, 0)..close();
   Canvas.drawPath(whiteArc, Paint()..color = kcolor);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return false;
  }

}