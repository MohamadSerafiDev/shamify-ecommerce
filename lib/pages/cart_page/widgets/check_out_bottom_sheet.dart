import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:store/cubits/fetch_cart/fetch_cart_cubit.dart';
import 'package:store/services/cart/get_checkout.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

Future<dynamic> CheckOutBottomSheet(BuildContext context,
    {required void Function() onTapOrder}) {
  return showModalBottomSheet(
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
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: FutureBuilder(
              //فاتورة
              future: GetCheckout().getInvoice(
                dataBody: jsonEncode(
                  {'items': BlocProvider.of<FetchCartCubit>(context).orderList},
                ),
              ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  num total =
                      snapshot.data[snapshot.data.length - 1]['totalPrice'];
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Checkout',
                          ),
                          const Gap(20),
                          ...List.generate(
                            snapshot.data.length - 1,
                            (index) {
                              return buildCheckoutItem(
                                  snapshot.data[index]['name'],
                                  snapshot.data[index]['quantity'],
                                  snapshot.data[index]['price']);
                            },
                          ),
                          const Divider(),
                          buildSummaryRow('Subtotal', total),
                          buildSummaryRow('tax', 12.80),
                          buildSummaryRow('Total', total + 12.80),
                          const Gap(20),
                          ElevatedButton(
                            onPressed: onTapOrder,
                            child: const Text('Place Order'),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: SpinKitDoubleBounce(
                      color: Constants.buttoncolor,
                    ),
                  );
                }
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              },
            ),
          );
        },
      );
    },
  );
}

///////
///
///
///
Widget buildCheckoutItem(String name, String quantity, num price) {
  return ListTile(
    title: Text(name),
    subtitle: Text('Quantity: $quantity'),
    trailing: Text(
      '\$$price',
      style: TextStyles.textStyle14,
    ),
  );
}

Widget buildSummaryRow(String label, num amount) {
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
