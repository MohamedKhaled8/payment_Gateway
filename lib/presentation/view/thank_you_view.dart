import 'package:flutter/material.dart';
import 'package:paymentgetway/presentation/widgets/my_cart_view_widgets/custom_app_bar.dart';
import 'package:paymentgetway/presentation/widgets/payment_details_widgets/thanky_you_viewBody.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Transform.translate(
          offset: const Offset(0, -16), child: const ThankYouViewBody()),
    );
  }
}
