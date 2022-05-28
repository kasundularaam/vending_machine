import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentServices {
  static Future makePayment(
      {required String amount, required String currency}) async {
    try {
      Map<String, dynamic> paymentIntentData =
          await createPaymentIntent(amount, currency);
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        applePay: true,
        googlePay: true,
        testEnv: true,
        merchantCountryCode: 'US',
        merchantDisplayName: 'Prospects',
        customerId: paymentIntentData['customer'],
        paymentIntentClientSecret: paymentIntentData['client_secret'],
        customerEphemeralKeySecret: paymentIntentData['ephemeralKey'],
      ));
      displayPaymentSheet();
    } catch (e, s) {
      log(e.toString());
      throw ('exception:$e$s');
    }
  }

  static Future displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } on Exception catch (e) {
      if (e is StripeException) {
        throw ("Error from Stripe: ${e.error.localizedMessage}");
      } else {
        throw ("Unforeseen error: $e");
      }
    } catch (e) {
      throw ("exception:$e");
    }
  }

  static Future createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'sk_test_51Hr9i7K5z0mbMwohJ4yWkuXJrzmveOxYtpX3sZdsG8ZspaG2p0vvkUwLd9F18f9O86ZDG6GRgPvZb81GukHoVIXd0048AQpNKR',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (err) {
      throw 'err charging user: ${err.toString()}';
    }
  }

  static calculateAmount(String amount) {
    final a = (double.parse(amount)) * 100;
    return a.toString();
  }
}
