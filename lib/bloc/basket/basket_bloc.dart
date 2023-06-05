import 'package:apple_shop/bloc/basket/baset_event.dart';
import 'package:apple_shop/bloc/basket/basket_state.dart';
import 'package:apple_shop/util/extenstions/string_extenstions.dart';
import 'package:bloc/bloc.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';

import '../../data/repository/basket_repository.dart';
import '../../di/di.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final IBasketRepository _basketRepository = locator.get();
  PaymentRequest _paymentRequest = PaymentRequest();
  BasketBloc() : super(BasketInitState()) {
    on<BasketFetchFromHiveEvent>(((event, emit) async {
      var basketItemList = await _basketRepository.getAllBasketItems();
      var finalPrice = await _basketRepository.getBasketFinalPrice();
      emit(BasketDataFetchedState(basketItemList, finalPrice));
    }));

    on<BasketPaymentInitEvent>((event, emmit) async {
      _paymentRequest.setIsSandBox(true);
      _paymentRequest.setAmount(1000);
      _paymentRequest.setDescription('this is for test application apple shop');
      _paymentRequest.setMerchantID('d645fba8-1b29-11ea-be59-000c295eb8fc');
      _paymentRequest.setCallbackURL('expertflutter://shop');
      linkStream.listen((deeplink) {
        if (deeplink!.toLowerCase().contains('authority')) {
          String? authority = deeplink.extractValueFromQuery('Authority');
          String? status = deeplink.extractValueFromQuery('Status');
          ZarinPal().verificationPayment(status!, authority!, _paymentRequest,
              (isPaymentSuccess, refID, paymentRequest) {
            if (isPaymentSuccess) {
              print(refID);
            } else {
              print('error');
            }
          });
        }
      });
    });

    on<BasketPaymentRequestEvent>((event, emmit) async {
      ZarinPal().startPayment(_paymentRequest, (status, paymentGatewayUri) {
        if (status == 100) {
          launchUrl(Uri.parse(paymentGatewayUri!),
              mode: LaunchMode.externalApplication);
        }
      });
    });
  }
}
