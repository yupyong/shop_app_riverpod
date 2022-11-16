import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen(
      {required this.title,
      required this.imageUrl,
      required this.description,
      required this.price});

  final String imageUrl;
  final String title;
  final String description;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              child: AspectRatio(
                aspectRatio: 13 / 9,
                child: Image(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${price.toString()}円',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
