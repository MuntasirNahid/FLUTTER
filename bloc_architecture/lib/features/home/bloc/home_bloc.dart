import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/data/cart_items.dart';
import 'package:bloc_architecture/data/gorcery_data.dart';
import 'package:bloc_architecture/data/wish_list_items.dart';
import 'package:bloc_architecture/features/home/models/home_product_data_models.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(
      HomeLoadingState(),
    );

    //as we are not using any db, so we are doing this purposefully to get delay
    await Future.delayed(
      const Duration(seconds: 3),
    );

    emit(
      HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageURL'],
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    //print('Product cart button clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
  //  print('Product Wishlist button clicked');
    wishlistItems.add(event.clickedProduct);

    emit(HomeProductItemWishListedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(
      HomeNavigateToWishlistPageActionState(),
    );
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(
      HomeNavigateToCartPageActionState(),
    );
  }
}
