
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_gateway/feature/checkout/data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:payment_gateway/feature/checkout/presentation/manager/payment_cubit.dart';
import 'package:payment_gateway/feature/checkout/presentation/views/thank_you_view.dart';

import 'custom_bottom.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          return    CustomButton(
            onTap:() {

              PaymentIntentInputModel paymentIntentInputModel=PaymentIntentInputModel(amount: "100", currency: "USD", );
              BlocProvider.of<PaymentCubit>(context).makePayment(
                  paymentIntentInputModel: paymentIntentInputModel);
            }, 
              isLoading: state is PaymentLoading?true:false,
              text: "Continue" );});
        }

  }


