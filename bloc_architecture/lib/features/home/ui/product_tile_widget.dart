// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bloc_architecture/features/home/bloc/home_bloc.dart';
import 'package:bloc_architecture/features/home/models/home_product_data_models.dart';

class ProductTileWidget extends StatelessWidget {
  const ProductTileWidget({
    Key? key,
    required this.productDataModel,
    required this.homeBloc,
  }) : super(key: key);
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  productDataModel.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            productDataModel.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(productDataModel.description),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text('\$${productDataModel.price}'),
              const Spacer(),
              IconButton(
                onPressed: () {
                  homeBloc.add(
                    HomeProductWishlistButtonClickedEvent(
                      clickedProduct: productDataModel,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.favorite_border,
                ),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(
                    HomeProductCartButtonClickedEvent(
                      clickedProduct: productDataModel,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
