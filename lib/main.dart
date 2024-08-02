import 'package:flutter/material.dart';

import 'feature/checkout/presentation/views/my_cart_view.dart';

void main() {
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
