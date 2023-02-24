import 'package:apple_shop/bloc/categoryProduct/category_product_bloc.dart';
import 'package:apple_shop/screens/product_list_screen.dart';
import 'package:apple_shop/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/category.dart';

class CategoryItemChip extends StatelessWidget {
  final Category category;
  const CategoryItemChip(
    this.category, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String categoryColor = 'ff${category.color}';
    int hexColor = int.parse(categoryColor, radix: 16);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: ((context) => CategoryProductBloc()),
              child: ProductListScreen(category),
            ),
          ),
        );
      },
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: ShapeDecoration(
                    color: Color(hexColor),
                    shadows: [
                      BoxShadow(
                        color: Color(hexColor),
                        blurRadius: 25,
                        spreadRadius: -12,
                        offset: Offset(0.0, 15),
                      )
                    ],
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
              ),
              SizedBox(
                width: 24,
                height: 24,
                child: Center(
                  child: CachedImage(
                    imageUrl: category.icon,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            category.title ?? 'محصول',
            style: TextStyle(fontFamily: 'SB', fontSize: 12),
          )
        ],
      ),
    );
  }
}
