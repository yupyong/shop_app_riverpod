import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/product_provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/products_grid.dart';
import 'package:shop_app/widgets/badge.dart';

enum FilterOption {
  Favorites,
  all,
}

class ProductOverviewScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productNotifier = ref.read(productItemNotifier.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'PRODUCT',
          style: TextStyle(
              fontFamily: 'Lato-Regular.ttf',
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              letterSpacing: 1.5),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CartScreen();
              }));
            },
            child: Badge(
                child: Icon(
                  Icons.shopping_cart_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                color: Theme.of(context).primaryColor,
                value: ref.watch(cartInsideProvider).length.toString()),
          ),
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              if (selectedValue == FilterOption.Favorites) {
                productNotifier.favoriteItems();
              } else {
                productNotifier.getAllItem();
              }
            },
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryColor,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Favorite Only'),
                value: FilterOption.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOption.all,
              ),
            ],
          )
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
