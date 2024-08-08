

import 'package:dartz/dartz.dart';
import 'package:payment_gateway/feature/checkout/data/models/payment_intent_input_model/payment_intent_input_model.dart';

import '../../../../core/errors/failures.dart';

abstract class CheckoutRepo{
  Future<Either<Failure,void>> makePayment({required
  PaymentIntentInputModel paymentIntentInputModel
  });}


