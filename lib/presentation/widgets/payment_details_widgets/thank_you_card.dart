import 'package:flutter/material.dart';
import 'package:paymentgetway/core/helper/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paymentgetway/presentation/widgets/my_cart_view_widgets/custom_order_info_item.dart';
import 'package:paymentgetway/presentation/widgets/payment_details_widgets/custom_info_widgets.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22).r,
        child: Column(
          children: [
            Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.style18,
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomOrderInfoItem(
              title: 'Date',
              value: '01/24/2023',
              style: Styles.style24,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomOrderInfoItem(
              title: 'Time',
              value: '10:15 AM',
              style: Styles.style24,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomOrderInfoItem(
              title: 'To',
              value: 'Sam Louis',
              style: Styles.style24,
            ),
            Divider(
              height: 60.h,
              thickness: 2,
            ),
            CustomOrderInfoItem(
              title: 'Total',
              value: r'$50.97',
              style: Styles.style24,
            ),
            SizedBox(
              height: 20.h,
            ),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  FontAwesomeIcons.barcode,
                  size: 55.h,
                ),
                Container(
                  width: 120.w,
                  height: 50.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.50.w, color: const Color(0xFF34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: Styles.style24
                          .copyWith(color: const Color(0xff34A853)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}
