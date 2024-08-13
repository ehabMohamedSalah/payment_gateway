
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_gateway/core/utils/api_key.dart';
import 'package:payment_gateway/feature/checkout/data/models/Details.dart';
import 'package:payment_gateway/feature/checkout/data/models/paypal_model/item_list_mod/Item_list_model.dart';
import 'package:payment_gateway/feature/checkout/data/models/paypal_model/item_list_mod/Items.dart';
 import 'package:payment_gateway/feature/checkout/data/models/paypal_model/item_list_mod/amout_model/Amount_model.dart';
 import 'package:payment_gateway/feature/checkout/presentation/manager/payment_cubit.dart';
import 'package:payment_gateway/feature/checkout/presentation/views/thank_you_view.dart';
import 'package:provider/provider.dart';

import '../../../data/models/payment_intent_input_model/payment_intent_input_model.dart';
import '../../provider.dart';
import 'custom_bottom.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SettingProvider provider=Provider.of<SettingProvider>(context);

    return BlocConsumer<PaymentCubit,PaymentState>(
      listener: (context, state)
      {
      if(state is PaymentSuccess) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ThankYouView(),));
      }
      if(state is PaymentFailure) {
        Navigator.pop(context);
        SnackBar snackBar=SnackBar(content: Text(state.ErrorMessage));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
        builder: (context, state) {
          return   provider.index==0? CustomButton(
            onTap:() {
                //code by3ml payment b stripe
              PaymentIntentInputModel paymentIntentInputModel=PaymentIntentInputModel(amount: "100", currency: "USD",customerId:'cus_QcoM73OjIOdC7d'  );
              BlocProvider.of<PaymentCubit>(context).makePayment(
                  paymentIntentInputModel: paymentIntentInputModel);



              },
              isLoading: state is PaymentLoading?true:false,
              text: "Continue" ):CustomButton(
              onTap:() {
                //code by3ml payment b stripe
                /*PaymentIntentInputModel paymentIntentInputModel=PaymentIntentInputModel(amount: "100", currency: "USD",customerId:'cus_QcoM73OjIOdC7d'  );
              BlocProvider.of<PaymentCubit>(context).makePayment(
                  paymentIntentInputModel: paymentIntentInputModel);*/


                var transactionsData=getTransactionData();
                excutePaypalPayment(context, transactionsData);
              },
              isLoading: state is PaymentLoading?true:false,
              text: "Continue" );});
        }

  void excutePaypalPayment(BuildContext context, ({AmountModel amount, ItemListModel itemList}) transactionsData) {
     Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,  //enta fe al live wala test
        clientId: ApiKeys.clientID,   //hngebhom mn al dashboard
        secretKey: ApiKeys.paypalsecretKey,
        transactions:   [        //data bta3t al oder
            {
        //details al oder mn hes al s3r
        "amount":transactionsData.amount.toJson(),
        "description": "The payment transaction description.",

        "item_list":transactionsData.itemList.toJson() ,
        }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.push(context, MaterialPageRoute(builder: (context) => ThankYouView(),));

        //  Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount,ItemListModel itemList})getTransactionData(){
     var amount=AmountModel(
       total: "100",
       currency:'USD',
       details: Details(
           shipping: "0",
           shippingDiscount: 0,
           subtotal: '100'
       ),

     );
     List<OrderItemModel> orders=[
       OrderItemModel(
         currency: 'USD',
         name: 'Apple',
         price: '4',
         quantity: 10,
       ),
       OrderItemModel(
         currency: 'USD',
         name: 'Apple',
         price: '5',
         quantity: 12,
       ),
     ];
     var itemList=ItemListModel(
       items: orders,
     );

     return (amount:amount,itemList:itemList);
        }

  }


