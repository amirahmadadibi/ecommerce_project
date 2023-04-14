import 'package:hive_flutter/hive_flutter.dart';

import '../model/card_item.dart';

abstract class IBasketDatasource {
  Future<void> addProduct(BasketItem basketItem);
}

class BasketLocalDatasouce extends IBasketDatasource {
  var box = Hive.box<BasketItem>('CardBox');

  @override
  Future<void> addProduct(BasketItem basketItem) async {
    box.add(basketItem);
  }
}
