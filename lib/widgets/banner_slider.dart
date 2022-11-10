import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/colors.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.8);

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
              controller: controller,
              itemCount: 3,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Container(
                    height: 200,
                    color: Colors.red,
                  ),
                );
              })),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const ExpandingDotsEffect(
                expansionFactor: 4,
                dotHeight: 10,
                dotWidth: 10,
                dotColor: Colors.white,
                activeDotColor: CustomColors.blueIndicator),
          ),
        )
      ],
    );
  }
}
