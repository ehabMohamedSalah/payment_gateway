import 'package:flutter/material.dart';
import 'package:payment_gateway/feature/checkout/presentation/views/widgets/my_cart_view_body.dart';

import '../../../../core/utils/styles.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.black,),
        title: Text(
          "My Cart",
          textAlign: TextAlign.center,
          style: Styles.style25,
        ) ,
        centerTitle: true,
      ),
      body: MyCartViewBody(),
    );
  }
}
