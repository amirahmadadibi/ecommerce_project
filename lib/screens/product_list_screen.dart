import 'package:apple_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/colors.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

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
                          'پرفروش ترین ها',
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
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(((context, index) {
                  //   return ProductItem();
                  return Text('1');
                })),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 2.8,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
