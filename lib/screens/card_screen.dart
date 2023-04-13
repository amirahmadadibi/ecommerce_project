import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/util/extenstions/string_extenstions.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.backgroundScreenColor,
        body: SafeArea(
            child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 44, right: 44, bottom: 32),
                    child: Container(
                      height: 46,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          Image.asset('assets/images/icon_apple_blue.png'),
                          const Expanded(
                            child: Text(
                              'سبد خرید',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'sb',
                                  fontSize: 16,
                                  color: CustomColors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return CardItem();
                }, childCount: 10)),
                SliverPadding(padding: EdgeInsets.only(bottom: 100))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 44, right: 44, bottom: 20),
              child: SizedBox(
                height: 53,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 18, fontFamily: 'sm'),
                        backgroundColor: CustomColors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {},
                    child: Text('ادامه فرایند خرید')),
              ),
            )
          ],
        )));
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 249,
      margin: const EdgeInsets.only(left: 44, right: 44, bottom: 20),
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
                        Text(
                          'ایفون ۱۳ پرومکس',
                          style: TextStyle(fontFamily: 'sb', fontSize: 16),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'گارانتی فیلان ۱۸ ماهه',
                          style: TextStyle(fontFamily: 'sm', fontSize: 12),
                        ),
                        SizedBox(
                          height: 6,
                        ),
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
                            SizedBox(
                              width: 4,
                            ),
                            Text('تومان',
                                style:
                                    TextStyle(fontFamily: 'sm', fontSize: 12)),
                            SizedBox(
                              width: 4,
                            ),
                            Text('۴۹.۱۲۳.۱۲۳',
                                style:
                                    TextStyle(fontFamily: 'sm', fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Wrap(
                          spacing: 8,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: CustomColors.red, width: 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 2, bottom: 2, right: 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('حذف',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontFamily: 'sm',
                                            fontSize: 12,
                                            color: CustomColors.red)),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Image.asset('assets/images/icon_trash.png')
                                  ],
                                ),
                              ),
                            ),
                            OptionCheap(
                              'آبی',
                              color: 'eb34b4',
                            ),
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
                Text('تومان', style: TextStyle(fontFamily: 'sb', fontSize: 16)),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '59.000.000',
                  style: TextStyle(fontFamily: 'sb', fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OptionCheap extends StatelessWidget {
  String? color;
  String title;
  OptionCheap(this.title, {Key? key, this.color}) : super(key: key);

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
        padding: const EdgeInsets.only(top: 2, bottom: 2, right: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 10,
            ),
            if (color != null) ...{
              Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.parseToColor(),
                ),
              )
            },
            Text(title,
                textDirection: TextDirection.rtl,
                style: TextStyle(fontFamily: 'sm', fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
