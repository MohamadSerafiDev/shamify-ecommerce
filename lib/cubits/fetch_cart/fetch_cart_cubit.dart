import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/services/cart/get_cart.dart';

part 'fetch_cart_state.dart';

class FetchCartCubit extends Cubit<FetchCartState> {
  FetchCartCubit() : super(FetchCartInitial());

  Future<void> cart({required String query}) async {
    try {
      emit(FetchCartLoading());
      CartModel data = await GetCart().getCart();
      if (data.item.isNotEmpty) {
        emit(FetchCartSuccess(cart: data));
      } else {
        emit(FetchCartInitial());
      }
    } catch (e) {
      emit(FetchCartFailure(errormessage: e.toString()));
    }
  }
}
