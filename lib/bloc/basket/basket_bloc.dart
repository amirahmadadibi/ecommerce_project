import 'package:apple_shop/bloc/basket/baset_event.dart';
import 'package:apple_shop/bloc/basket/basket_state.dart';
import 'package:apple_shop/util/pyament_handler.dart';
import 'package:bloc/bloc.dart';

import '../../data/repository/basket_repository.dart';
import '../../di/di.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final IBasketRepository _basketRepository = locator.get();
  PaymentHandler paymentHandler = ZarinpalPaymentHandler();
  BasketBloc() : super(BasketInitState()) {
    on<BasketFetchFromHiveEvent>(((event, emit) async {
      var basketItemList = await _basketRepository.getAllBasketItems();
      var finalPrice = await _basketRepository.getBasketFinalPrice();
      emit(BasketDataFetchedState(basketItemList, finalPrice));
    }));

    on<BasketPaymentInitEvent>((event, emmit) async {
      paymentHandler.initPaymentRequest();
    });

    on<BasketPaymentRequestEvent>((event, emmit) async {
      paymentHandler.sendPaymentRequest();
    });
  }
}
