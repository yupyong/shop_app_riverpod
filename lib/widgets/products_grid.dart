import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/providers/product_provider.dart';
import 'package:shop_app/widgets/Product_item.dart';

class ProductsGrid extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsData = ref.watch(productItemNotifier);

    return Container(
      padding: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        itemCount: productsData.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(productsData[index]);
        },
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          mainAxisExtent: 152,
        ),
      ),
    );
  }
}
