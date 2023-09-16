import 'package:apple_shop/bloc/basket/baset_event.dart';
import 'package:apple_shop/bloc/basket/basket_state.dart';
import 'package:apple_shop/util/pyament_handler.dart';
import 'package:bloc/bloc.dart';

import '../../data/repository/basket_repository.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final IBasketRepository _basketRepository;
  final PaymentHandler _paymentHandler;
  BasketBloc(this._paymentHandler, this._basketRepository)
      : super(BasketInitState()) {
    on<BasketFetchFromHiveEvent>(((event, emit) async {
      var basketItemList = await _basketRepository.getAllBasketItems();
      var finalPrice = await _basketRepository.getBasketFinalPrice();
      emit(BasketDataFetchedState(basketItemList, finalPrice));
    }));

    on<BasketPaymentInitEvent>((event, emmit) async {
      var finalPrice = await _basketRepository.getBasketFinalPrice();
      _paymentHandler.initPaymentRequest(finalPrice);
    });

    on<BasketPaymentRequestEvent>((event, emmit) async {
      _paymentHandler.sendPaymentRequest();
    });

    on<BasketRemoveProductEvent>((event, emmit) async {
      _basketRepository.removeProduct(event.index);
      var basketItemList = await _basketRepository.getAllBasketItems();
      var finalPrice = await _basketRepository.getBasketFinalPrice();
      emmit(BasketDataFetchedState(basketItemList, finalPrice));
    });
  }
}
