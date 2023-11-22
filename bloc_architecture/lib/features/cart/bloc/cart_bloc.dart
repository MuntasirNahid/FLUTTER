import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/data/cart_items.dart';
import 'package:bloc_architecture/features/home/models/home_product_data_models.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
  }



  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
     emit(
      CartSuccessState(
        cartItems: cartItems,
      ),
     );
  }
}
