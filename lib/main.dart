import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'core/utils/api_key.dart';
import 'feature/checkout/presentation/views/my_cart_view.dart';

void main() {
  Stripe.publishableKey=ApiKeys.publishableKey;
  runApp(const CheckoutApp());
}
 class CheckoutApp extends StatelessWidget {
   const CheckoutApp({super.key});

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       home: MyCartView(),
       debugShowCheckedModeBanner: false,
     );
   }
 }



     //PaymentIntentObject create payment intent(amount,currency)              >>DIO 3shan req W hkhle al parameters 3ala shkl model l2n fe aktr mn parameter 1
    // init payment sheet(paymentIntentClientSecret)                           >>  paymentIntentClientSecret>mwgoda gowa al obj ale hyrg3
   //present paymentsheet()                                                    >> howa by3rf en da nfs al obj alee 3mltlo int fe al stripe

