import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store/pages/orders_page/widgets/orders_list_view.dart';
import 'package:store/pages/orders_page/widgets/tab_row.dart';
import 'package:store/services/orders/get_orders.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              TabBar(
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey.withOpacity(0.3),
                      blurStyle: BlurStyle.inner,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                splashFactory: NoSplash.splashFactory,
                tabs: const [
                  Tab(
                    child: TabRow(
                      text: 'Pending',
                      icon: Icons.timer,
                    ),
                  ),
                  Tab(
                    child: TabRow(
                      text: 'Fulfilled',
                      icon: Icons.done_all,
                    ),
                  ),
                ],
              ),
              FutureBuilder(
                future: GetOrders().get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.88,
                      child: TabBarView(
                        children: [
                          //pending
                          OrdersListView(
                            data: snapshot.data!,
                            status: 'pending',
                            icon: const Center(
                                child: SpinKitPouringHourGlass(
                              color: Constants.buttoncolor,
                              strokeWidth: 0.5,
                              size: 30,
                            )),
                          ),
                          //fulfilled
                          OrdersListView(
                            data: snapshot.data!,
                            status: 'fulfilled',
                            icon: Image.asset(
                              AppIcons.truesing,
                              color: Constants.buttoncolor,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                        child: SpinKitPouringHourGlass(
                      color: Constants.buttoncolor,
                      strokeWidth: 0.5,
                      size: 30,
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
