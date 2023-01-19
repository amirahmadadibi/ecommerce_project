import 'package:apple_shop/data/model/category.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryState {}

class CategoryInitState extends CategoryState {}

class CategoryResponseState extends CategoryState {
  Either<String, List<Category>> response;
  CategoryResponseState(this.response);
}

class CategoryLoadingState extends CategoryState {}
