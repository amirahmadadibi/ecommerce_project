import 'package:zarinpal/zarinpal.dart';

abstract class PaymentHandler {
  Future<void> initPaymentRequest();
  Future<void> sendPaymentRequest();
  Future<void> verifyPaymentRequest();
}

class ZarinpalPaymentHandler extends PaymentHandler {
  PaymentRequest _paymentRequest = PaymentRequest();
  String? authority;
  String? status;

  @override
  Future<void> initPaymentRequest() async {
    _paymentRequest.setIsSandBox(true);
    _paymentRequest.setAmount(1000);
    _paymentRequest.setDescription('this is for test application apple shop');
    _paymentRequest.setMerchantID('d645fba8-1b29-11ea-be59-000c295eb8fc');
    _paymentRequest.setCallbackURL('expertflutter://shop');
  }

  @override
  Future<void> sendPaymentRequest() async {
    ZarinPal().startPayment(_paymentRequest, (status, paymentGatewayUri) {
      if (status == 100) {
        // launchUrl(Uri.parse(paymentGatewayUri!),
        //     mode: LaunchMode.externalApplication);
      }
    });
  }

  @override
  Future<void> verifyPaymentRequest() async {
    ZarinPal().verificationPayment(status!, authority!, _paymentRequest,
        (isPaymentSuccess, refID, paymentRequest) {
      if (isPaymentSuccess) {
        print(refID);
      } else {
        print('error');
      }
    });
  }
}


class PapalPaymentHandler extends PaymentHandler{
  @override
  Future<void> initPaymentRequest() async {

  }

  @override
  Future<void> sendPaymentRequest() async  {
  
  }

  @override
  Future<void> verifyPaymentRequest() async {
  
  }

}
