import 'dart:ui';

import 'package:apple_shop/bloc/product/product_bloc.dart';
import 'package:apple_shop/bloc/product/product_event.dart';
import 'package:apple_shop/bloc/product/product_state.dart';
import 'package:apple_shop/data/model/product_variant.dart';
import 'package:apple_shop/data/repository/product_detail_repository.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/colors.dart';
import '../data/model/product_image.dart';
import '../data/model/variant.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(ProductInitializeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: ((context, state) {
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                if (state is ProductDetailLoadingState) ...{
                  const SliverToBoxAdapter(
                    child: Center(
                        child: SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(),
                    )),
                  )
                },
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
                if (state is ProductDetailResponseState) ...{
                  state.productImages.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (productImageList) {
                    return GalleryWidget(productImageList);
                  })
                },
                if (state is ProductDetailResponseState) ...{
                  state.productVariant.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (productVariantList) {
                    return VariantContainer(productVariantList);
                  }),
                },
                // SliverToBoxAdapter(
                //   child: Padding(
                //     padding:
                //         const EdgeInsets.only(top: 20, right: 44, left: 44),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.end,
                //       children: [
                //         const Text(
                //           'انتخاب حافظه داخلی',
                //           style: TextStyle(fontFamily: 'sm', fontSize: 12),
                //         ),
                //         const SizedBox(
                //           height: 10,
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           children: [
                //             Container(
                //               margin: const EdgeInsets.only(left: 10),
                //               height: 25,
                //               decoration: BoxDecoration(
                //                 color: Colors.white,
                //                 borderRadius:
                //                     const BorderRadius.all(Radius.circular(8)),
                //                 border: Border.all(
                //                     width: 1, color: CustomColors.gery),
                //               ),
                //               child: const Padding(
                //                 padding: EdgeInsets.symmetric(horizontal: 20),
                //                 child: Center(
                //                     child: Text(
                //                   '128',
                //                   style:
                //                       TextStyle(fontFamily: 'sb', fontSize: 12),
                //                 )),
                //               ),
                //             ),
                //             Container(
                //               margin: const EdgeInsets.only(left: 10),
                //               height: 25,
                //               decoration: BoxDecoration(
                //                 color: Colors.white,
                //                 borderRadius:
                //                     const BorderRadius.all(Radius.circular(8)),
                //                 border: Border.all(
                //                     width: 1, color: CustomColors.gery),
                //               ),
                //               child: const Padding(
                //                 padding: EdgeInsets.symmetric(horizontal: 20),
                //                 child: Center(
                //                     child: Text(
                //                   '128',
                //                   style:
                //                       TextStyle(fontFamily: 'sb', fontSize: 12),
                //                 )),
                //               ),
                //             ),
                //             Container(
                //               margin: const EdgeInsets.only(left: 10),
                //               height: 25,
                //               decoration: BoxDecoration(
                //                 color: Colors.white,
                //                 borderRadius:
                //                     const BorderRadius.all(Radius.circular(8)),
                //                 border: Border.all(
                //                     width: 1, color: CustomColors.gery),
                //               ),
                //               child: const Padding(
                //                 padding: EdgeInsets.symmetric(horizontal: 20),
                //                 child: Center(
                //                     child: Text(
                //                   '128',
                //                   style:
                //                       TextStyle(fontFamily: 'sb', fontSize: 12),
                //                 )),
                //               ),
                //             ),
                //           ],
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(top: 24, left: 44, right: 44),
                    height: 46,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: CustomColors.gery),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
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
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 44, left: 44),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        PriceTagButton(),
                        AddToBasketButton(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class VariantContainer extends StatelessWidget {
  List<ProductVarint> productVariantList;
  VariantContainer(
    this.productVariantList, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 44, left: 44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              productVariantList[1].variantType.title!,
              style: TextStyle(fontFamily: 'sm', fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
            SotrageVariantList(productVariantList[1].variantList)
            // ColorVarinantList(productVariantList[0].variantList)
          ],
        ),
      ),
    );
  }
}

class GalleryWidget extends StatefulWidget {
  List<ProductImage> productImageList;
  int selectedItem = 0;
  GalleryWidget(
    this.productImageList, {
    Key? key,
  }) : super(key: key);

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/icon_star.png',
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Text(
                            '۴.۶',
                            style: TextStyle(fontFamily: 'sm', fontSize: 12),
                          ),
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                        height: double.infinity,
                        child: CachedImage(
                            imageUrl: widget
                                .productImageList[widget.selectedItem]
                                .imageUrl),
                      ),
                      Spacer(),
                      Image.asset('assets/images/icon_favorite_deactive.png')
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.only(left: 44, right: 44, top: 4),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.productImageList.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.selectedItem = index;
                          });
                        },
                        child: Container(
                          height: 70,
                          width: 70,
                          margin: const EdgeInsets.only(left: 20),
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border:
                                Border.all(width: 1, color: CustomColors.gery),
                          ),
                          child: CachedImage(
                            imageUrl: widget.productImageList[index].imageUrl,
                            radius: 10,
                          ),
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
    );
  }
}

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Positioned(
          child: Container(
            height: 60,
            width: 140,
            decoration: const BoxDecoration(
                color: CustomColors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
        ),
        Positioned(
          child: GestureDetector(
            onTap: () async {
              IDetailProductRepository repository = locator.get();
              var reponse = await repository.getProuctImage();
              reponse.fold((l) {}, (r) {
                r.forEach((element) {
                  print(element.imageUrl);
                });
              });
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 53,
                  width: 160,
                  child: const Center(
                    child: Text(
                      'افزودن سبد خرید',
                      style: TextStyle(
                          fontFamily: 'sb', fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PriceTagButton extends StatelessWidget {
  const PriceTagButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Positioned(
          child: Container(
            height: 60,
            width: 140,
            decoration: const BoxDecoration(
                color: CustomColors.green,
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
        ),
        Positioned(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 53,
                width: 160,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        'تومان',
                        style: TextStyle(
                            fontFamily: 'sm',
                            fontSize: 12,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '۴۹،۸۰۰،۰۰۰',
                            style: TextStyle(
                                fontFamily: 'sm',
                                fontSize: 12,
                                color: Colors.white,
                                decoration: TextDecoration.lineThrough),
                          ),
                          Text(
                            '۴۸،۸۰۰،۰۰۰',
                            style: TextStyle(
                              fontFamily: 'sm',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                          child: Text(
                            '٪۳',
                            style: TextStyle(
                                fontFamily: 'sb',
                                fontSize: 12,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ColorVarinantList extends StatefulWidget {
  List<Variant> variantList;

  ColorVarinantList(this.variantList, {super.key});

  @override
  State<ColorVarinantList> createState() => _ColorVarinantListState();
}

class _ColorVarinantListState extends State<ColorVarinantList> {
  List<Widget> colorWidgets = [];
  @override
  void initState() {
    for (var colorVariant in widget.variantList) {
      String categoryColor = 'ff${colorVariant.value}';
      int hexColor = int.parse(categoryColor, radix: 16);
      var item = Container(
        margin: const EdgeInsets.only(left: 10),
        height: 26,
        width: 26,
        decoration: BoxDecoration(
          color: Color(hexColor),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      );

      colorWidgets.add(item);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 26,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: colorWidgets.length,
            itemBuilder: ((context, index) {
              return colorWidgets[index];
            })),
      ),
    );
  }
}

class SotrageVariantList extends StatefulWidget {
  List<Variant> storageVarinats;
  SotrageVariantList(this.storageVarinats, {super.key});

  @override
  State<SotrageVariantList> createState() => _SotrageVariantListState();
}

class _SotrageVariantListState extends State<SotrageVariantList> {
  List<Widget> storageWidgetList = [];
  @override
  void initState() {
    for (var storageVariant in widget.storageVarinats) {
      var item = Container(
        margin: const EdgeInsets.only(left: 10),
        height: 25,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(width: 1, color: CustomColors.gery),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
              child: Text(
            storageVariant.value!,
            style: TextStyle(fontFamily: 'sb', fontSize: 12),
          )),
        ),
      );

      storageWidgetList.add(item);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 26,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: storageWidgetList.length,
            itemBuilder: ((context, index) {
              return storageWidgetList[index];
            })),
      ),
    );
  }
}
