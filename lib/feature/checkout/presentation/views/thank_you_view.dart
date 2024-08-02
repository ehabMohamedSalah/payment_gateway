import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_gateway/feature/checkout/presentation/views/my_cart_view.dart';
import 'package:payment_gateway/feature/checkout/presentation/views/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder:  (context) =>MyCartView() ,));
        }, icon:Icon(Icons.arrow_back),),
      ),
      body:Transform.translate(
          offset: Offset(0,-1),
          child: ThankYouViewBody()) ,
    );
  }
}
