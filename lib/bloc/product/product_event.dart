abstract class ProductEvent {}

class ProductInitializeEvent extends ProductEvent {
  String productId;
  String categoryId;
  ProductInitializeEvent(this.productId,this.categoryId);
}
