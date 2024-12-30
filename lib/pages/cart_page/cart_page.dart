import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store/cubits/fetch_cart/fetch_cart_cubit.dart';
import 'package:store/pages/cart_page/widgets/cart_product.dart';
import 'package:store/pages/cart_page/widgets/check_out_button.dart';
import 'package:store/pages/cart_page/widgets/no_data_in_cart.dart';
import 'package:store/pages/global_widgets/error_dialog.dart';
import 'package:store/styles/constants.dart';

class CartPage extends HookWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      BlocProvider.of<FetchCartCubit>(context).cart();
      BlocProvider.of<FetchCartCubit>(context).orderList = [];
      return null;
    }, []);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: BlocConsumer<FetchCartCubit, FetchCartState>(
        listener: (context, state) {
          if (state is FetchCartFailure) {
            errorDialog(context,
                title: 'error',
                message: state.errormessage,
                contentType: ContentType.failure);
          }
        },
        builder: (context, state) {
          if (state is FetchCartLoading) {
            return const Center(
              child: SpinKitDoubleBounce(
                color: Constants.buttoncolor,
              ),
            );
          } else if (state is FetchCartSuccess) {
            return Stack(
              children: [
                ListView.builder(
                  clipBehavior: Clip.none,
                  itemCount: state.cart.length,
                  itemBuilder: (context, index) {
                    // for handling checkout data in form id and quantity
                    BlocProvider.of<FetchCartCubit>(context).orderList.add({
                      'id': state.cart[index]['item']['id'],
                      'quantity': state.cart[index]['quantity'].toString(),
                    });
                    //
                    return CartProduct(
                      state: state,
                      index: index,
                    );
                  },
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.78,
                  left: MediaQuery.of(context).size.width * 0.23,
                  width: 200,
                  child: const CheckOutButton(),
                )
              ],
            );
          } else {
            return const NoDataInCart();
          }
        },
      ),
    );
  }
}
