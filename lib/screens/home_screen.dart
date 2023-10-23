import 'package:apple_shop/bloc/home/home_bloc.dart';
import 'package:apple_shop/bloc/home/home_state.dart';
import 'package:apple_shop/data/model/banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../bloc/home/home_event.dart';
import '../constants/colors.dart';
import '../data/model/category.dart';
import '../data/model/product.dart';
import '../widgets/category_icon_item_chip.dart';
import '../widgets/banner_slider.dart';
import '../widgets/loading_animation.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return _getHomeScreenContent(state, context);
        },
      )),
    );
  }
}

Widget _getHomeScreenContent(HomeState state, BuildContext context) {
  if (state is HomeLoadingState) {
    return const Center(
      child: LoadingAnimation(),
    );
  } else if (state is HomeRequestSuccessState) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomeBloc>().add(HomeGetInitilzeData());
      },
      child: CustomScrollView(
        slivers: [
          const SliverPadding(padding: EdgeInsets.only(top: 24)),
          const _getSearchBox(),
          state.bannerList.fold((exceptionMessage) {
            return SliverToBoxAdapter(child: Text(exceptionMessage));
          }, (listBanners) {
            return _getBanners(listBanners);
          }),
          const _getCategoryListTitle(),
          state.categoryList.fold((exceptionMessage) {
            return SliverToBoxAdapter(child: Text(exceptionMessage));
          }, (categoryList) {
            return _getCategoryList(categoryList);
          }),
          const _getBestSellerTitle(),
          state.bestSellerProductList.fold((exceptionMessage) {
            return SliverToBoxAdapter(child: Text(exceptionMessage));
          }, (productList) {
            return _getBestSellerProducts(productList);
          }),
          const _getMostViewedTitle(),
          state.hotestProductList.fold((exceptionMessage) {
            return SliverToBoxAdapter(child: Text(exceptionMessage));
          }, (productList) {
            return _getMostViewedProduct(productList);
          }),
          const SliverPadding(padding: EdgeInsets.only(top: 24)),
        ],
      ),
    );
  } else {
    return const Center(
      child: Text('خطایی در دریافت اطلاعات به وجود آمده!'),
    );
  }
}

class _getMostViewedProduct extends StatelessWidget {
  final List<Product> productList;
  _getMostViewedProduct(
    this.productList, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 44),
        child: SizedBox(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productList.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ProductItem(productList[index]),
                );
              })),
        ),
      ),
    );
  }
}

class _getMostViewedTitle extends StatelessWidget {
  const _getMostViewedTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 44, right: 44, bottom: 20, top: 32),
        child: Row(
          children: [
            const Text(
              'پربازدید ترین‌ ها',
              style: TextStyle(
                  fontFamily: 'sb', fontSize: 12, color: CustomColors.gery),
            ),
            const Spacer(),
            const Text(
              'مشاهده همه',
              style: TextStyle(fontFamily: 'sb', color: CustomColors.blue),
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset('assets/images/icon_left_categroy.png'),
          ],
        ),
      ),
    );
  }
}

class _getBestSellerProducts extends StatelessWidget {
  List<Product> productList;
  _getBestSellerProducts(
    this.productList, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 44),
        child: SizedBox(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productList.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ProductItem(productList[index]),
                );
              })),
        ),
      ),
    );
  }
}

class _getBestSellerTitle extends StatelessWidget {
  const _getBestSellerTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 44, right: 44, bottom: 20),
        child: Row(
          children: [
            const Text(
              'پرفروش ترین‌ ها',
              style: TextStyle(
                  fontFamily: 'sb', fontSize: 12, color: CustomColors.gery),
            ),
            const Spacer(),
            const Text(
              'مشاهده همه',
              style: TextStyle(fontFamily: 'sb', color: CustomColors.blue),
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset('assets/images/icon_left_categroy.png'),
          ],
        ),
      ),
    );
  }
}

class _getCategoryList extends StatelessWidget {
  List<Category> listCategories;
  _getCategoryList(
    this.listCategories, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 44),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listCategories.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CategoryItemChip(listCategories[index]),
                );
              })),
        ),
      ),
    );
  }
}

class _getCategoryListTitle extends StatelessWidget {
  const _getCategoryListTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 44, right: 44, bottom: 20, top: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'دسته‌ بندی',
              style: TextStyle(
                  fontFamily: 'sb', fontSize: 12, color: CustomColors.gery),
            )
          ],
        ),
      ),
    );
  }
}

class _getBanners extends StatelessWidget {
  List<BannerCampain> bannerCampain;
  _getBanners(
    this.bannerCampain, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BannerSlider(bannerCampain),
    );
  }
}

class _getSearchBox extends StatelessWidget {
  const _getSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
              Image.asset('assets/images/icon_search.png'),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                child: Text(
                  'جستجوی محصولات',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'sb', fontSize: 16, color: CustomColors.gery),
                ),
              ),
              Image.asset('assets/images/icon_apple_blue.png'),
              const SizedBox(
                width: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
