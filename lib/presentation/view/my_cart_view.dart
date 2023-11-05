import 'package:flutter/material.dart';
import 'package:paymentgetway/presentation/widgets/my_cart_view_widgets/custom_app_bar.dart';
import 'package:paymentgetway/presentation/widgets/my_cart_view_widgets/custom_my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: const CustomMyCartViewBody(),
    );
  }
}
