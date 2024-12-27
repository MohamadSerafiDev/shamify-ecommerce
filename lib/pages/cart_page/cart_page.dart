import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:store/cubits/fetch_cart/fetch_cart_cubit.dart';
import 'package:store/pages/cart_page/widgets/name_and_desc.dart';
import 'package:store/pages/cart_page/widgets/price_n_counter.dart';
import 'package:store/pages/global_widgets/error_dialog.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

class CartPage extends HookWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      BlocProvider.of<FetchCartCubit>(context).cart();
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Constants.darkinsidecolor,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(AppImages.parcel),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 80,
                                child: NameAndDesc(
                                  name: state.cart[index]['item']['name'],
                                  desc: state.cart[index]['item']
                                      ['description'],
                                ),
                              ),
                              const SizedBox(
                                width: 80,
                              ),
                              PriceNCounter(
                                quantity: int.parse(state.cart[1]['quantity']),
                                price: state.cart[index]['price'],
                              )
                            ],
                          )),
                    );
                  },
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.78,
                  left: MediaQuery.of(context).size.width * 0.23,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Check Out >>',
                      style: TextStyles.textStyle18,
                    ),
                  ),
                )
              ],
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.parcel,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'No data in your Cart',
                    style: TextStyles.textStyle18,
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
