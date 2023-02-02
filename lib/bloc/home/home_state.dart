import 'package:apple_shop/data/model/category.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/banner.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<BannerCampain>> bannerList;
    Either<String, List<Category>> categoryList;

  HomeRequestSuccessState(this.bannerList,this.categoryList);
}
