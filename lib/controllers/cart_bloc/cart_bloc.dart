import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store/data/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState(cartItems: {})) {
    on<AddProductToCartEvent>((event, emit) {
      Map<ProductModel, int> items = {...state.cartItems};
      final int count =
          items.containsKey(event.product) ? items[event.product]! : 0;
      items[event.product] = count + 1;
      CartState newState = CartState(cartItems: items);
      emit(newState);
    });
    on<DecreaseCountEvent>((event, emit) {
      if (state.cartItems.containsKey(event.product)) {
        if (state.cartItems[event.product]! > 1) {
          Map<ProductModel, int> items = {...state.cartItems};
          items[event.product] = items[event.product]! - 1;
          emit(CartState(cartItems: items));
        }
      }
    });
    on<RemoveProductFromCartEvent>((event, emit) {
      Map<ProductModel, int> items = {...state.cartItems};
      items.remove(event.product);
      emit(CartState(cartItems: items));
    });
  }
}
