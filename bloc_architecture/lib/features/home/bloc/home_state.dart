// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

/*
state are of two type:
1)Simple state that are going to build my ui
2)Actionable state, that will handle when an action will happen

*/

@immutable

//whenever i am coming to app , i want my ui should be built. HomeState handles this thing.

sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({
    required this.products,
  });
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemWishListedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}
