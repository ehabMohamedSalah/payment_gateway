import 'package:flutter/material.dart';
import 'package:payment_gateway/feature/checkout/presentation/views/widgets/payment_details_view_body.dart';

import '../../../../core/utils/styles.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.black,),
        title: Text(
          "Payment Details",
          textAlign: TextAlign.center,
          style: Styles.style25,
        ) ,
        centerTitle: true,
      ),
      body: PaymentDetailViewBody(),
    );
  }
}
