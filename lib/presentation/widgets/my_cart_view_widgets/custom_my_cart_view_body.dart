import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentgetway/core/helper/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paymentgetway/data/repos/check_out_repo_imp.dart';
import 'package:paymentgetway/presentation/manger/cubit/stripe_payment_cubit.dart';
import 'package:paymentgetway/presentation/widgets/my_cart_view_widgets/custom_button.dart';
import 'package:paymentgetway/presentation/widgets/my_cart_view_widgets/custom_order_info_item.dart';
import 'package:paymentgetway/presentation/widgets/my_cart_view_widgets/payment_method_bottom_sheet.dart';

class CustomMyCartViewBody extends StatelessWidget {
  const CustomMyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).r,
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/basket_image.png')),
          SizedBox(
            height: 20.h,
          ),
          CustomOrderInfoItem(
            title: 'Order Subtotal',
            value: r'42.97$',
            style: Styles.style18,
          ),
          SizedBox(
            height: 3.h,
          ),
          CustomOrderInfoItem(
            title: 'Discount',
            value: r'0$',
            style: Styles.style18,
          ),
          SizedBox(
            height: 3.h,
          ),
          CustomOrderInfoItem(
            title: 'Shipping',
            value: r'8$',
            style: Styles.style18,
          ),
          Divider(
            thickness: 2,
            height: 34.h,
            color: const Color(0xffC7C7C7),
          ),
          CustomOrderInfoItem(
            title: 'Total',
            value: r'$50.97',
            style: Styles.style24,
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomButton(
            text: 'Complete Payment',
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  builder: (context) {
                    return BlocProvider(
                      create: (context) =>
                          StripePaymentCubit(CheckOutRepoImp()),
                      child: const PaymentMethodsBottomSheet(),
                    );
                  });
            },
            color: Colors.white,
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}
