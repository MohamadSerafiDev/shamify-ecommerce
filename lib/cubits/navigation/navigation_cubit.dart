import 'package:bloc/bloc.dart';
import 'package:store/pages/cart_page/cart_page.dart';
import 'package:store/pages/home_page/home_page.dart';
import 'package:store/pages/orders_page/orders_page.dart';
import 'package:store/pages/profile_page/profile_page.dart';

part 'navigation_state.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit() : super(NavigationBarState(0));
  List pages = [
    const HomePage(),
    const CartPage(),
    const OrdersPage(),
    const ProfilePage()
  ];
  int currentIndex = 0;

  void selectTab(int index) {
    currentIndex = index;
    emit(NavigationBarState(index));
  }
}
