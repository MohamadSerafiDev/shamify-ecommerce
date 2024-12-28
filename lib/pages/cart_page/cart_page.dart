import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:store/api/api.dart';
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
                    BlocProvider.of<FetchCartCubit>(context).orderList.add({
                      'id': state.cart[index]['item']['id'],
                      'quantity': state.cart[index]['quantity'],
                      'price': state.cart[index]['price'],
                    });
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).cardColor,
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
                                quantity: state.cart[index]['quantity']
                                        is String
                                    ? int.parse(state.cart[index]['quantity'])
                                    : state.cart[index]['quantity'],
                                price: state.cart[index]['price'],
                                index: index,
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
                    onPressed: () {
                      print(BlocProvider.of<FetchCartCubit>(context).orderList);
                      //bottom sheet checkout info
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        showDragHandle: true,
                        builder: (context) {
                          return DraggableScrollableSheet(
                            initialChildSize: 0.6,
                            maxChildSize: 0.7,
                            expand: false,
                            builder: (context, scrollController) {
                              return Container(
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                ),
                                child: SingleChildScrollView(
                                  controller: scrollController,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Checkout',
                                        ),
                                        const SizedBox(height: 20),
                                        _buildCheckoutItem(
                                            'Product 1', 2, 29.99),
                                        _buildCheckoutItem(
                                            'Product 2', 1, 49.99),
                                        _buildCheckoutItem(
                                            'Product 3', 3, 19.99),
                                        const Divider(),
                                        _buildSummaryRow('Subtotal', 159.95),
                                        _buildSummaryRow('Tax', 12.80),
                                        _buildSummaryRow('Total', 172.75),
                                        const SizedBox(height: 20),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: const Text('Place Order'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                      // Api().post(
                      //     url: '${Constants.localip}/api/v1/purchase-products',
                      //     body: BlocProvider.of<FetchCartCubit>(context)
                      //         .orderList,
                      //     withToken: true);
                    },
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

///////
///
///
///
Widget _buildCheckoutItem(String name, int quantity, double price) {
  return ListTile(
    title: Text(name),
    subtitle: Text('Quantity: $quantity'),
    trailing: Text('\$${price.toStringAsFixed(2)}'),
  );
}

Widget _buildSummaryRow(String label, double amount) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text('\$${amount.toStringAsFixed(2)}'),
      ],
    ),
  );
}
