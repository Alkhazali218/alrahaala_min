import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/login/Presentation/login_view.dart';
import 'package:alrahaala/features/splash/Presentation/on_boarding_model.dart';
import 'package:alrahaala/features/splash/Presentation/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: camel_case_types
class plashViewBody extends StatefulWidget {
  const plashViewBody({super.key});

  @override
  State<plashViewBody> createState() => _plashViewBodyState();
}

// ignore: camel_case_types
class _plashViewBodyState extends State<plashViewBody> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: Arcpaint(),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height / 1.35,
              width: MediaQuery.sizeOf(context).width,
            ),
          ),
          // for lottie animation file
          Positioned(
            top: 220,
            right: 0,
            left: 0,
            child: Lottie.network(onboardintItems[currentIndex].lottieURL,
                width: 500, alignment: Alignment.topCenter),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 270,
              child: Column(
                children: [
                  Flexible(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: onboardintItems.length,
                      itemBuilder: (context, index) {
                        final items = onboardintItems[index];
                        return Column(
                          children: [
                            Text(
                              items.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    getRsonsiveFontSize(context, fontSize: 30),
                                color: kcolor,
                              ),
                            ),
                            const SizedBox(height: 50),
                            Text(
                              items.subtitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    getRsonsiveFontSize(context, fontSize: 17),
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        );
                      },
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                      },
                    ),
                  ),
                  //dot indicator
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int index = 0;
                          index < onboardintItems.length;
                          index++)
                        dotindicator(isSelected: index == currentIndex)
                    ],
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            pageController.nextPage(
                duration: const Duration(microseconds: 500),
                curve: Curves.linear);
            Navigator.pushNamed(context, loginView.id);
          },
          elevation: 0,
          backgroundColor: const Color(0xffFAF7F0),
          child: Text(
            'تخطي',
            style: TextStyle(
              color: kcolor,
              fontSize: getRsonsiveFontSize(context, fontSize: 18),
            ),
          )),
    );
  }

  Widget dotindicator({required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: AnimatedContainer(
        duration: const Duration(microseconds: 500),
        height: isSelected ? 8 : 6,
        width: isSelected ? 8 : 6,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Colors.black : Colors.black26),
      ),
    );
  }
}
