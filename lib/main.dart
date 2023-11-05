import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymentgetway/core/helper/api_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paymentgetway/presentation/view/my_cart_view.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishablekey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Payment GetWay',
          home: MyCartView(),
        );
      },
    );
  }
}
