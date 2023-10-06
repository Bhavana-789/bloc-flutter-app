import 'package:bloc_flutter_app/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_flutter_app/features/home/bloc/home_bloc.dart';
import 'package:bloc_flutter_app/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({Key? key, required this.productDataModel, required this.cartBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.pink,
                image: DecorationImage(
                    image: NetworkImage(productDataModel.imageUrl),fit: BoxFit.cover)
            ),
          ),
          const SizedBox(height: 20,),
          Text(productDataModel.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          Text(productDataModel.description),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + productDataModel.price.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              Row(

                children: [
                  IconButton(
                      onPressed: () {
                        //homeBloc.add(HomeWishlistButtonNavigateEvent());
                        //homeBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: productDataModel));
                      },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        // homeBloc.add(HomeCartButtonNavigateEvent());
                       // homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: productDataModel));
                        cartBloc.add(CartRemoveFromCartEvent(productDataModel: productDataModel));
                      },
                      icon: const Icon(Icons.shopping_bag)),
                ],
              )
            ],
          ),



        ],
      ),
    );
  }
}
