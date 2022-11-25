import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/colors.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 44, right: 44, bottom: 32),
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
                          'آیفون',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'sb',
                              fontSize: 16,
                              color: CustomColors.blue),
                        ),
                      ),
                      Image.asset('assets/images/icon_back.png'),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Se 2022 آیفون',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'sb', fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Container(
                  height: 284,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/icon_star.png',
                              ),
                              const Text(
                                '۴.۶',
                                style:
                                    TextStyle(fontFamily: 'sm', fontSize: 12),
                              ),
                              Spacer(),
                              SizedBox(
                                height: double.infinity,
                                child: Image.asset(
                                  'assets/images/iphone.png',
                                ),
                              ),
                              Spacer(),
                              Image.asset(
                                  'assets/images/icon_favorite_deactive.png')
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 44, right: 44),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: ((context, index) {
                              return Container(
                                height: 70,
                                width: 70,
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(
                                      width: 1, color: CustomColors.gery),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child:
                                      Image.asset('assets/images/iphone.png'),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 44, left: 44),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'انتخاب رنگ',
                      style: TextStyle(fontFamily: 'sm', fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 26,
                          width: 26,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 26,
                          width: 26,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 26,
                          width: 26,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 44, left: 44),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'انتخاب حافظه داخلی',
                      style: TextStyle(fontFamily: 'sm', fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border:
                                Border.all(width: 1, color: CustomColors.gery),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                                child: Text(
                              '128',
                              style: TextStyle(fontFamily: 'sb', fontSize: 12),
                            )),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border:
                                Border.all(width: 1, color: CustomColors.gery),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                                child: Text(
                              '128',
                              style: TextStyle(fontFamily: 'sb', fontSize: 12),
                            )),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border:
                                Border.all(width: 1, color: CustomColors.gery),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                                child: Text(
                              '128',
                              style: TextStyle(fontFamily: 'sb', fontSize: 12),
                            )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 24, left: 44, right: 44),
                height: 46,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: CustomColors.gery),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset('assets/images/icon_left_categroy.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'مشاهده',
                      style: TextStyle(
                          fontFamily: 'sb',
                          fontSize: 12,
                          color: CustomColors.blue),
                    ),
                    const Spacer(),
                    const Text(
                      ': مشخصات فنی ',
                      style: TextStyle(fontFamily: 'sm'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 24, left: 44, right: 44),
                height: 46,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: CustomColors.gery),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset('assets/images/icon_left_categroy.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'مشاهده',
                      style: TextStyle(
                          fontFamily: 'sb',
                          fontSize: 12,
                          color: CustomColors.blue),
                    ),
                    const Spacer(),
                    const Text(
                      ': توضییحات محصول',
                      style: TextStyle(fontFamily: 'sm'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 24, left: 44, right: 44),
                height: 46,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: CustomColors.gery),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset('assets/images/icon_left_categroy.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'مشاهده',
                      style: TextStyle(
                          fontFamily: 'sb',
                          fontSize: 12,
                          color: CustomColors.blue),
                    ),
                    const Spacer(),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 26,
                          width: 26,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        Positioned(
                          right: 15,
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 26,
                            width: 26,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 30,
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 26,
                            width: 26,
                            decoration: const BoxDecoration(
                              color: Colors.yellow,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 45,
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 26,
                            width: 26,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 60,
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 26,
                            width: 26,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: const Center(
                                child: Text(
                              '+10',
                              style: TextStyle(
                                  fontFamily: 'sb',
                                  fontSize: 12,
                                  color: Colors.white),
                            )),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      ': نظرات کاربران',
                      style: TextStyle(fontFamily: 'sm'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
