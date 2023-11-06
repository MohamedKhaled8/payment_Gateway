import 'package:flutter/material.dart';
import 'package:paymentgetway/presentation/view/thank_you_view.dart';
import 'package:paymentgetway/presentation/manger/cubit/stripe_payment_cubit.dart';
import 'package:paymentgetway/presentation/widgets/my_cart_view_widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';import 'package:paymentgetway/core/functions/get_transctions.dart';


// ignore_for_file: public_member_api_docs, sort_constructors_first

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    Key? key,
    required this.isPaypal,
  }) : super(key: key);
  final bool isPaypal;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        }

        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            if (isPaypal) {
              var transctionsData = getTransctionsData();
              BlocProvider.of<PaymentCubit>(context)
                  .exceutePaypalPayment(context, transctionsData);
            } else {
              BlocProvider.of<PaymentCubit>(context)
                  .excuteStripePayment(context);
            }
          },
          isLoading: state is PaymentLoading ? true : false,
          color: Colors.white,
          text: 'Containy',
        );
      },
    );
  }
}
