import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/services/cart/get_cart.dart';

part 'fetch_cart_state.dart';

class FetchCartCubit extends Cubit<FetchCartState> {
  FetchCartCubit() : super(FetchCartInitial());
  List orderList = [];

  Future<void> cart() async {
    try {
      emit(FetchCartLoading());
      dynamic data = await GetCart().getCart();
      print('============$data==========');
      if (data != null) {
        emit(FetchCartSuccess(cart: data['items']));
      } else {
        emit(FetchCartInitial());
      }
    } catch (e) {
      emit(FetchCartFailure(errormessage: e.toString()));
    }
  }

  void removeFromCart(int index) {
    orderList.removeAt(index);
    emit(FetchCartSuccess(cart: orderList));
  }

  void orderPlaced() {
    orderList = [];
    emit(FetchCartInitial());
  }
}
