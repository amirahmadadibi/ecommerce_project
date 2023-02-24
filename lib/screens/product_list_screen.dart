import 'package:apple_shop/bloc/categoryProduct/category_product_bloc.dart';
import 'package:apple_shop/bloc/categoryProduct/category_product_event.dart';
import 'package:apple_shop/bloc/categoryProduct/category_product_state.dart';
import 'package:apple_shop/data/model/category.dart';
import 'package:apple_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/colors.dart';

class ProductListScreen extends StatefulWidget {
  Category category;
  ProductListScreen(this.category, {super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryProductBloc>(context)
        .add(CategoryProductInitialize(widget.category.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductBloc, CategoryProductState>(
        builder: ((context, state) {
      return Scaffold(
        backgroundColor: CustomColors.backgroundScreenColor,
        body: SafeArea(
          child: CustomScrollView(
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
                        Expanded(
                          child: Text(
                            widget.category.title!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
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
              if (state is CategoryProductLoadingState) ...{
                const SliverToBoxAdapter(
                  child: Center(
                      child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(),
                  )),
                )
              },
              if (state is CategoryProductResponseSuccessState) ...{
                state.productListByCategory.fold((l) {
                  return SliverToBoxAdapter(
                    child: Text(l),
                  );
                }, (productList) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 44),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(((context, index) {
                        //   return ProductItem();
                        return ProductItem(productList[index]);
                      }), childCount: productList.length),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 2.8,
                              mainAxisSpacing: 30,
                              crossAxisSpacing: 30),
                    ),
                  );
                })
              }
            ],
          ),
        ),
      );
    }));
  }
}
