import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentgetway/presentation/view/thank_you_view.dart';
import 'package:paymentgetway/presentation/manger/cubit/stripe_payment_cubit.dart';
import 'package:paymentgetway/presentation/widgets/my_cart_view_widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
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
            BlocProvider.of<StripePaymentCubit>(context)
                .excuteStripePayment(context);
          },
          isLoading: state is PaymentLoading ? true : false,
          color: Colors.white,
          text: 'Containy',
        );
      },
    );
  }
}
