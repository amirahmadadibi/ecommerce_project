abstract class ProductEvent {}

class ProductInitializeEvent extends ProductEvent {
  String productId;
  ProductInitializeEvent(this.productId);
}
