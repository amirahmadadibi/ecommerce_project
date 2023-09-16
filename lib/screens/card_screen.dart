import 'package:apple_shop/bloc/basket/baset_event.dart';
import 'package:apple_shop/bloc/basket/basket_bloc.dart';
import 'package:apple_shop/bloc/basket/basket_state.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/data/model/card_item.dart';
import 'package:apple_shop/util/extenstions/double_extenstions.dart';
import 'package:apple_shop/util/extenstions/string_extenstions.dart';
import 'package:apple_shop/widgets/cached_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.backgroundScreenColor,
        body: SafeArea(child: BlocBuilder<BasketBloc, BasketState>(
          builder: ((context, state) {
            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                CustomScrollView(
                  slivers: [
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
                    if (state is BasketDataFetchedState) ...{
                      state.basketItemList.fold(((l) {
                        return SliverToBoxAdapter(
                          child: Text(l),
                        );
                      }), ((basketItemList) {
                        return SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return CardItem(basketItemList[index], index);
                          }, childCount: basketItemList.length),
                        );
                      }))
                    },
                    SliverPadding(padding: EdgeInsets.only(bottom: 100))
                  ],
                ),
                if (state is BasketDataFetchedState) ...{
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 44, right: 44, bottom: 20),
                    child: SizedBox(
                      height: 53,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              textStyle:
                                  TextStyle(fontSize: 18, fontFamily: 'sm'),
                              backgroundColor: CustomColors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {
                            context
                                .read<BasketBloc>()
                                .add(BasketPaymentInitEvent());

                            context
                                .read<BasketBloc>()
                                .add(BasketPaymentRequestEvent());
                          },
                          child: Text(
                            (state.basketFinalPrice == 0)
                                ? 'سبد خرید شما خالیه '
                                : 'پرداخت مبلغ : ${state.basketFinalPrice.convertToPrice()} ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                  )
                }
              ],
            );
          }),
        )));
  }
}

class CardItem extends StatelessWidget {
  final BasketItem basketItem;
  final int index;
  const CardItem(
    this.basketItem,
    this.index, {
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
                          basketItem.name,
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
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<BasketBloc>()
                                    .add(BasketRemoveProductEvent(index));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: CustomColors.red, width: 1),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2, bottom: 2, right: 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text('حذف',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              fontFamily: 'sm',
                                              fontSize: 12,
                                              color: CustomColors.red)),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Image.asset(
                                          'assets/images/icon_trash.png')
                                    ],
                                  ),
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
                  child: SizedBox(
                      height: 104,
                      width: 75,
                      child: CachedImage(imageUrl: basketItem.thumbnail)),
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
                  '${basketItem.realPrice.convertToPrice()}',
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
  final String? color;
  final String title;
  const OptionCheap(this.title, {Key? key, this.color}) : super(key: key);

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
