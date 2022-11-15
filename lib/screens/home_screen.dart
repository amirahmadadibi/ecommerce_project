import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/Category_icon_item_chip.dart';
import '../widgets/banner_slider.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                        'جستجوی محصولات',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontFamily: 'sb',
                            fontSize: 16,
                            color: CustomColors.gery),
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
          ),
          const SliverToBoxAdapter(
            child: BannerSlider(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 44, right: 44, bottom: 20, top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'دسته‌ بندی',
                    style: TextStyle(
                        fontFamily: 'sb',
                        fontSize: 12,
                        color: CustomColors.gery),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
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
          ),
          SliverToBoxAdapter(
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
                    style:
                        TextStyle(fontFamily: 'sb', color: CustomColors.blue),
                  ),
                  const Spacer(),
                  const Text(
                    'پرفروش ترین‌ ها',
                    style: TextStyle(
                        fontFamily: 'sb',
                        fontSize: 12,
                        color: CustomColors.gery),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 44, right: 44, bottom: 20, top: 32),
              child: Row(
                children: [
                  Image.asset('assets/images/icon_left_categroy.png'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'مشاهده همه',
                    style:
                        TextStyle(fontFamily: 'sb', color: CustomColors.blue),
                  ),
                  const Spacer(),
                  const Text(
                    'پربازدید ترین‌ ها',
                    style: TextStyle(
                        fontFamily: 'sb',
                        fontSize: 12,
                        color: CustomColors.gery),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
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
          )
        ],
      )),
    );
  }
}
