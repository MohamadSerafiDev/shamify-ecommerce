import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/services/cart/delete_from_cart.dart';
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
      if (data != null && data['total_quantity'] != 0) {
        emit(FetchCartSuccess(cart: data['items']));
      } else {
        emit(FetchCartInitial());
      }
    } catch (e) {
      emit(FetchCartFailure(errormessage: e.toString()));
    }
  }

  void removeFromCart(int index, int id) async {
    emit(FetchCartLoading());
    dynamic data = await DeleteFromCart().delete(id);
    orderList.removeAt(index);
    if (data['new cart']['total_quantity'] != 0) {
      emit(
        FetchCartSuccess(
          cart: data['new cart']['items'],
        ),
      );
    } else {
      orderList = [];
      emit(FetchCartInitial());
    }
  }

  void orderPlaced() {
    orderList = [];
    emit(FetchCartInitial());
  }
}
