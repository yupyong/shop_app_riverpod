import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/product_provider.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends ConsumerWidget {
  ProductItem(this.product);

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDetailScreen(
            title: product.title,
            imageUrl: product.imageUrl,
            description: product.description,
            price: product.price,
          );
        }));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: GridTile(
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
                footer: GridTileBar(
                  title: Text(''),
                  leading: IconButton(
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      ref.read(productItemNotifier.notifier).toggle(product.id);
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      //カートにいれる処理
                      //cart形でデータを保存している
                      ref.read(cartInsideProvider.notifier).addCart(Cart(
                          id: product.id,
                          title: product.title,
                          quantity: 1,
                          price: product.price,
                          imageUrl: product.imageUrl));
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            product.title,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontFamily: 'Lato-Regular.ttf'),
          ),
        ],
      ),
    );
  }
}
