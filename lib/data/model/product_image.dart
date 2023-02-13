import 'dart:convert';

class ProductImage {
  String? imageUrl;
  String? productId;

  ProductImage(this.imageUrl, this.productId);

  factory ProductImage.fromJson(Map<String, dynamic> jsonObject) {
    return ProductImage(
        'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['image']}',
        jsonObject['product_id']);
  }
}
