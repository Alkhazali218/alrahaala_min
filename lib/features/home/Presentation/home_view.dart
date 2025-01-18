import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/screen/Presentation/screen_view.dart';
import 'package:alrahaala/features/support/Presentation/support_view.dart';
import 'package:alrahaala/features/user/Presentation/user_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class homeView extends StatefulWidget {
  const homeView({super.key});
  static String id = 'home view';
  @override
  State<homeView> createState() => _homeViewState();
}

// ignore: camel_case_types
class _homeViewState extends State<homeView> {
int  index = 2;
final screen = const [
 supportView(),
 userView(),
 screenView(),
];
  @override
  Widget build(BuildContext context) {
  List<Widget>  items = [
      Icon(Icons.support_agent, size: getRsonsiveFontSize(context, fontSize: 30)),
      Icon(Icons.person, size:  getRsonsiveFontSize(context, fontSize: 30)),
       Icon(Icons.home, size:  getRsonsiveFontSize(context, fontSize: 30)),
    ];
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kcolor,
          title: Text(
            'شركة الرحالة القابضة',
            style: TextStyle(
              color: kprimaryColor,
              fontSize: getRsonsiveFontSize(context, fontSize: 30),
              fontFamily: 'decotype',
            )
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: kpColor)),
          child: CurvedNavigationBar(
            index: index,
            color: kcolor,
            buttonBackgroundColor: kprimaryColor,
           onTap: (index) => setState(
             () => this.index = index
           ),
           backgroundColor: kprimaryColor,
            animationDuration: const Duration(milliseconds: 300),
            items: items,
          ),
        ),
        body: screen[index],
      );
  }
}
