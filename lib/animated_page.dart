import 'package:flutter/material.dart';

typedef ChilBuilder = Widget Function(int index, BuildContext context);
typedef OnPageChangeCallBack = void Function(int index);

class Animated extends StatelessWidget {
  const Animated(
      {super.key,
      required this.pageController,
      required this.pageValue,
      required this.child,
      required this.pageCount,
      required this.onPageChangeCallBack});
  final PageController pageController;
  final double pageValue;
  final ChilBuilder child;
  final int pageCount;
  final OnPageChangeCallBack onPageChangeCallBack;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onPageChangeCallBack,
      physics: const ClampingScrollPhysics(),
      controller: pageController,
      itemCount: pageCount,
      itemBuilder: (context, index) {
        if (index == pageValue.floor() + 1 || index == pageValue.floor() + 2) {
          return Transform.translate(
            offset: Offset(0.0, 100 * (index - pageValue)),
            child: child(index, context),
          );
        } else if (index == pageValue.floor() ||
            index == pageValue.floor() - 1) {
          return Transform.translate(
            offset: Offset(0.0, 100 * (pageValue - index)),
            child: child(index, context),
          );
        } else {
          return child(index, context);
        }
      },
    );
  }
}
