import 'package:apple_shop/constants/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: Center(
        child: Container(
          height: 249,
          margin: const EdgeInsets.symmetric(horizontal: 44),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('1'),
                            Text('1'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 6),
                                    child: Text(
                                      '٪۳',
                                      style: TextStyle(
                                          fontFamily: 'sb',
                                          fontSize: 12,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Text('تومان'),
                                Text('۴۹.۱۲۳.۱۲۳')
                              ],
                            ),
                            Wrap(
                              children: [
                                OptionCheap(),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset('assets/images/iphone.png'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DottedLine(
                  lineThickness: 3.0,
                  dashLength: 8.0,
                  dashColor: CustomColors.gery.withOpacity(0.5),
                  dashGapLength: 3.0,
                  dashGapColor: Colors.transparent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('تومان'),
                    SizedBox(
                      width: 5,
                    ),
                    Text('59.000.000'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OptionCheap extends StatelessWidget {
  const OptionCheap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.gery, width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/icon_options.png'),
            SizedBox(
              width: 10,
            ),
            Text('1111111'),
          ],
        ),
      ),
    );
  }
}
