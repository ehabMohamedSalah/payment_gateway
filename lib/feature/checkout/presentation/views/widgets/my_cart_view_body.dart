import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_gateway/feature/checkout/presentation/views/payment_details.dart';

import '../../../../../core/utils/styles.dart';
import 'cart_info_item.dart';
import 'cart_total_price.dart';
import 'custom_bottom.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 18,),
          Expanded(child: Image.asset("assets/images/cart.png")),
          SizedBox(height: 25,),
          OrderInfoItem(title: "Order Subtotal",value:"47.12" ,),
          SizedBox(height: 3,),
          OrderInfoItem(title: "Discount",value:r'0$' ,),
          SizedBox(height: 3,),
          OrderInfoItem(title: "Shipping",value:r"8$" ,),
          Divider(),
          TotalPrice(title: 'Total',value: r'$50.97',),
          SizedBox(height: 16,),
          CustomButton(
            text: "Complete Payment",
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder:  (context) =>PaymentDetails() ,));
            },
          ),
          SizedBox(height: 12,),

        ],
      ),
    );
  }
}

