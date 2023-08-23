import 'dart:ui';

import 'package:apple_shop/bloc/basket/baset_event.dart';
import 'package:apple_shop/bloc/basket/basket_bloc.dart';
import 'package:apple_shop/bloc/comment/bloc/comment_bloc.dart';
import 'package:apple_shop/bloc/product/product_bloc.dart';
import 'package:apple_shop/bloc/product/product_event.dart';
import 'package:apple_shop/bloc/product/product_state.dart';
import 'package:apple_shop/data/model/product.dart';
import 'package:apple_shop/data/model/product_peroperty.dart';
import 'package:apple_shop/data/model/product_variant.dart';
import 'package:apple_shop/data/model/variant_type.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/widgets/cached_image.dart';
import 'package:apple_shop/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/colors.dart';
import '../data/model/product_image.dart';
import '../data/model/variant.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen(this.product, {super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) {
        var bloc = ProductBloc();
        bloc.add(ProductInitializeEvent(
            widget.product.id, widget.product.categoryId));
        return bloc;
      }),
      child: DetailContentWidget(
        parentWidget: widget,
      ),
    );
  }
}

class DetailContentWidget extends StatelessWidget {
  const DetailContentWidget({
    Key? key,
    required this.parentWidget,
  }) : super(key: key);

  final ProductDetailScreen parentWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: ((context, state) {
          if (state is ProductDetailLoadingState) {
            return Center(child: LoadingAnimation());
          }
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                if (state is ProductDetailResponseState) ...{
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 44, right: 44, bottom: 32),
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
                            Expanded(
                                child: state.productCategory.fold((l) {
                              return const Text(
                                'اطلاعات محصول',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'sb',
                                    fontSize: 16,
                                    color: CustomColors.blue),
                              );
                            }, (productCategory) {
                              return Text(
                                productCategory.title!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: 'sb',
                                    fontSize: 16,
                                    color: CustomColors.blue),
                              );
                            })),
                            Image.asset('assets/images/icon_back.png'),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                },
                if (state is ProductDetailResponseState) ...{
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        parentWidget.product.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'sb',
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                  )
                },
                if (state is ProductDetailResponseState) ...{
                  state.productImages.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (productImageList) {
                    return GalleryWidget(
                        parentWidget.product.thumbnail, productImageList);
                  })
                },
                if (state is ProductDetailResponseState) ...{
                  state.productVariant.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (productVariantList) {
                    return VariantContainerGenerator(productVariantList);
                  }),
                },
                if (state is ProductDetailResponseState) ...{
                  state.productProperties.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (propertyList) {
                    return ProductProperties(propertyList);
                  })
                },
                if (state is ProductDetailResponseState) ...{
                  ProductDescription(parentWidget.product.description)
                },
                if (state is ProductDetailResponseState) ...{
                  SliverToBoxAdapter(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            isDismissible: true,
                            useSafeArea: true,
                            showDragHandle: true,
                            builder: (context) {
                              return BlocProvider(
                                create: (context) {
                                  final bloc = CommentBloc(locator.get());
                                  bloc.add(CommentInitilzeEvent(
                                      parentWidget.product.id));
                                  return bloc;
                                },
                                child: CommentBottomsheet(
                                  productId: parentWidget.product.id,
                                ),
                              );
                            });
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 24, left: 44, right: 44),
                        height: 46,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(width: 1, color: CustomColors.gery),
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
                  )
                },
                if (state is ProductDetailResponseState) ...{
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 44, left: 44),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const PriceTagButton(),
                          AddToBasketButton(parentWidget.product),
                        ],
                      ),
                    ),
                  )
                }
              ],
            ),
          );
        }),
      ),
    );
  }
}

class CommentBottomsheet extends StatelessWidget {
  CommentBottomsheet({
    required this.productId,
    super.key,
  });
  final String productId;
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
      if (state is CommentLoading) {
        return const Center(
          child: LoadingAnimation(),
        );
      }
      return Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                if (state is CommentResponse) ...{
                  state.response.fold((l) {
                    return const SliverToBoxAdapter(
                      child: Text('خطایی در نمایش نظرات به وجود آمده'),
                    );
                  }, (commentList) {
                    if (commentList.isEmpty) {
                      return const SliverToBoxAdapter(
                        child:
                            Center(child: Text('نظری برای این محصول ثبت نشده')),
                      );
                    }
                    return SliverList(
                        delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      (commentList[index].username.isEmpty)
                                          ? 'کاربر'
                                          : commentList[index].username,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.end,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      commentList[index].text,
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: (commentList[index].avatar.isNotEmpty)
                                    ? CachedImage(
                                        imageUrl:
                                            commentList[index].userThumbnailUrl,
                                      )
                                    : Image.asset('assets/images/avatar.png'),
                              )
                            ],
                          ),
                        );
                      },
                      childCount: commentList.length,
                    ));
                  })
                },
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                          fontFamily: 'sm', fontSize: 18, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(color: Colors.black, width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide:
                            BorderSide(color: CustomColors.blue, width: 3),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Positioned(
                          child: Container(
                            height: 60,
                            decoration: const BoxDecoration(
                                color: CustomColors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                        Positioned(
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: GestureDetector(
                                onTap: () {
                                  if (textController.text.isEmpty) {
                                    return;
                                    //show error
                                    //dialog
                                    //snackbar
                                    //toast
                                  }
                                  context.read<CommentBloc>().add(
                                      CommentPostEvent(
                                          productId, textController.text));

                                  textController.text = '';
                                },
                                child: const SizedBox(
                                  height: 53,
                                  child: Center(
                                    child: Text(
                                      'افزودن نظر به محصول',
                                      style: TextStyle(
                                          fontFamily: 'sb',
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}

class ProductProperties extends StatefulWidget {
  List<Property> productPropertyList;

  ProductProperties(
    this.productPropertyList, {
    Key? key,
  }) : super(key: key);

  @override
  State<ProductProperties> createState() => _ProductPropertiesState();
}

class _ProductPropertiesState extends State<ProductProperties> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
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
                      fontFamily: 'sb', fontSize: 12, color: CustomColors.blue),
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
        Visibility(
          visible: _isVisible,
          child: Container(
            margin: const EdgeInsets.only(top: 24, left: 44, right: 44),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: CustomColors.gery),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.productPropertyList.length,
              itemBuilder: (context, index) {
                var property = widget.productPropertyList[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        '${property.value!} : ${property.title!}',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontFamily: 'sm',
                          fontSize: 14,
                          height: 1.8,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    ));
  }
}

class ProductDescription extends StatefulWidget {
  String productDescription;
  ProductDescription(
    this.productDescription, {
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
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
                      fontFamily: 'sb', fontSize: 12, color: CustomColors.blue),
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
        Visibility(
          visible: _isVisible,
          child: Container(
              margin: const EdgeInsets.only(top: 24, left: 44, right: 44),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: CustomColors.gery),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Text(
                widget.productDescription,
                style: TextStyle(fontFamily: 'sm', fontSize: 16, height: 1.8),
                textAlign: TextAlign.right,
              )),
        ),
      ],
    ));
  }
}

class VariantContainerGenerator extends StatelessWidget {
  List<ProductVarint> productVariantList;
  VariantContainerGenerator(
    this.productVariantList, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(children: [
        for (var productVariant in productVariantList) ...{
          if (productVariant.variantList.isNotEmpty) ...{
            VariantGeneratorChild(productVariant)
          }
        }
      ]),
    );
  }
}

class VariantGeneratorChild extends StatelessWidget {
  ProductVarint productVariant;
  VariantGeneratorChild(this.productVariant, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 44, left: 44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            productVariant.variantType.title!,
            style: TextStyle(fontFamily: 'sm', fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          if (productVariant.variantType.type == VariantTypeEnum.COLOR) ...{
            ColorVarinantList(productVariant.variantList)
          },
          if (productVariant.variantType.type == VariantTypeEnum.STORAGE) ...{
            SotrageVariantList(productVariant.variantList)
          }
        ],
      ),
    );
  }
}

class GalleryWidget extends StatefulWidget {
  List<ProductImage> productImageList;
  String? defaultProductThumbnail;

  int selectedItem = 0;
  GalleryWidget(
    this.defaultProductThumbnail,
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
                      const Spacer(),
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: CachedImage(
                            imageUrl: (widget.productImageList.isEmpty)
                                ? widget.defaultProductThumbnail
                                : widget.productImageList[widget.selectedItem]
                                    .imageUrl),
                      ),
                      Spacer(),
                      Image.asset('assets/images/icon_favorite_deactive.png')
                    ],
                  ),
                ),
              ),
              if (widget.productImageList.isNotEmpty) ...{
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
                              border: Border.all(
                                  width: 1, color: CustomColors.gery),
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
                const SizedBox(
                  height: 20,
                )
              }
            ],
          ),
        ),
      ),
    );
  }
}

class AddToBasketButton extends StatelessWidget {
  Product product;
  AddToBasketButton(this.product, {super.key});

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
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: GestureDetector(
                onTap: () {
                  context.read<ProductBloc>().add(ProductAddToBasket(product));
                  context.read<BasketBloc>().add(BasketFetchFromHiveEvent());
                },
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
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 30,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.variantList.length,
            itemBuilder: ((context, index) {
              String categoryColor = 'ff${widget.variantList[index].value}';
              int hexColor = int.parse(categoryColor, radix: 16);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(1),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    border: (_selectedIndex == index)
                        ? Border.all(
                            width: 1,
                            color: CustomColors.blueIndicator,
                            strokeAlign: BorderSide.strokeAlignOutside)
                        : Border.all(width: 2, color: Colors.white),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(hexColor),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
              );
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
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 26,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.storageVarinats.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: (_selectedIndex == index)
                        ? Border.all(
                            width: 2, color: CustomColors.blueIndicator)
                        : Border.all(width: 1, color: CustomColors.gery),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                        child: Text(
                      widget.storageVarinats[index].value!,
                      style: const TextStyle(fontFamily: 'sb', fontSize: 12),
                    )),
                  ),
                ),
              );
            })),
      ),
    );
  }
}
