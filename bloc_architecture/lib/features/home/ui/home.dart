import 'package:bloc_architecture/features/cart/ui/cart.dart';
import 'package:bloc_architecture/features/home/bloc/home_bloc.dart';
import 'package:bloc_architecture/features/home/ui/product_tile_widget.dart';
import 'package:bloc_architecture/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(
      HomeInitialEvent(),
    );
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      //i only want to listen when i get an action state
      listenWhen: (previous, current) => current is HomeActionState,
      //i only want to build when i don't get an action state
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        //i am getting a state and taking an action
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Cart(),
            ),
          );
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WishList(),
            ),
          );
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Item Carted',
              ),
            ),
          );
        } else if (state is HomeProductItemWishListedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Item WishListed',
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;

            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Grocery App',
                ),
                elevation: 0,
                backgroundColor: Colors.teal,
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeWishlistButtonNavigateEvent(),
                      );
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeCartButtonNavigateEvent(),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                    ),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    homeBloc: homeBloc,
                    productDataModel: successState.products[index],
                  );
                },
              ),
            );

          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
/*
 
*/