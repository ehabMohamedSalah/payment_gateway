import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_gateway/core/utils/api_key.dart';

import '../../feature/checkout/data/models/Payment_intet_model.dart';
import '../../feature/checkout/data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'api_service.dart';




class StripeService {
  final ApiService apiService=ApiService();

  //PaymentIntentObject create payment intent(amount,currency)
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }




// init payment sheet(paymentIntentClientSecret)
Future initPaymentSheet({required String paymentIntentClientSecret})async{
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentClientSecret,
      merchantDisplayName: "Ehab",
    ));
}


//present paymentsheet()
Future displayPaymentSheet()async{
   await  Stripe.instance.presentPaymentSheet();
}
//3ayz a3ml payment wahda t3de 3ala al 3 steps dol
Future makePayment(
    {required PaymentIntentInputModel paymentIntentInputModel})async{
    var paymentIntentModel=await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret:paymentIntentModel.clientSecret! );
    await displayPaymentSheet();
}
}



