import 'package:apple_shop/bloc/home/home_bloc.dart';
import 'package:apple_shop/bloc/home/home_event.dart';
import 'package:apple_shop/bloc/home/home_state.dart';
import 'package:apple_shop/data/model/banner.dart';
import 'package:apple_shop/data/repository/banner_repository.dart';
import 'package:apple_shop/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/colors.dart';
import '../widgets/Category_icon_item_chip.dart';
import '../widgets/banner_slider.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitilzeData());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              if (state is HomeLoadingState) ...[
                SliverToBoxAdapter(
                  child: CircularProgressIndicator(),
                )
              ],
              _getSearchBox(),
              if (state is HomeRequestSuccessState) ...[
                state.bannerList.fold((exceptionMessage) {
                  return SliverToBoxAdapter(child: Text(exceptionMessage));
                }, (listBanners) {
                  return _getBanners(listBanners);
                })
              ],
              _getCategoryListTitle(),
              _getCategoryList(),
              _getBestSellerTitle(),
              _getBestSellerProducts(),
              _getMostViewedTitle(),
              _getMostViewedProduct()
            ],
          );
        },
      )),
    );
  }
}

class _getMostViewedProduct extends StatelessWidget {
  const _getMostViewedProduct({
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
              itemCount: 10,
              itemBuilder: ((context, index) {
                return const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ProductItem(),
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
            Image.asset('assets/images/icon_left_categroy.png'),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'مشاهده همه',
              style: TextStyle(fontFamily: 'sb', color: CustomColors.blue),
            ),
            const Spacer(),
            const Text(
              'پربازدید ترین‌ ها',
              style: TextStyle(
                  fontFamily: 'sb', fontSize: 12, color: CustomColors.gery),
            )
          ],
        ),
      ),
    );
  }
}

class _getBestSellerProducts extends StatelessWidget {
  const _getBestSellerProducts({
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
              itemCount: 10,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ProductItem(),
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
            Image.asset('assets/images/icon_left_categroy.png'),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'مشاهده همه',
              style: TextStyle(fontFamily: 'sb', color: CustomColors.blue),
            ),
            const Spacer(),
            const Text(
              'پرفروش ترین‌ ها',
              style: TextStyle(
                  fontFamily: 'sb', fontSize: 12, color: CustomColors.gery),
            )
          ],
        ),
      ),
    );
  }
}

class _getCategoryList extends StatelessWidget {
  const _getCategoryList({
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
              itemCount: 10,
              itemBuilder: ((context, index) {
                return const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: CategoryItemChip(),
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
              Image.asset('assets/images/icon_apple_blue.png'),
              const Expanded(
                child: Text(
                  'جستجوی محصولات',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontFamily: 'sb', fontSize: 16, color: CustomColors.gery),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset('assets/images/icon_search.png'),
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
