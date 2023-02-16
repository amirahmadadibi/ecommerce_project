import 'package:apple_shop/data/model/variant.dart';
import 'package:apple_shop/data/model/variant_type.dart';

class ProductVarint {
  VariantType variantType;
  List<Variant> variantList;

  ProductVarint(this.variantType, this.variantList);
}
