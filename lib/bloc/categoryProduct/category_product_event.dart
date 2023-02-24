abstract class CategoryProductEvent {}

class CategoryProductInitialize extends CategoryProductEvent {
  String categoryId;
  CategoryProductInitialize(this.categoryId);
}
