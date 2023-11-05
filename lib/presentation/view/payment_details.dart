import 'package:flutter/material.dart';
import 'package:paymentgetway/presentation/widgets/my_cart_view_widgets/custom_app_bar.dart';
import 'package:paymentgetway/presentation/widgets/payment_details_widgets/PaymentDetailsViewBody.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Payment Details'),
      body: const PaymentDetailsViewBody(),
    );
  }
}
