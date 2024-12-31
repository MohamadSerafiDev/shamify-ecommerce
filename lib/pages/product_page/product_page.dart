import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Product product = Product(
    id: '1',
    name: 'Sample Product',
    price: 29.99,
    description: 'This is a sample product description. ',
    imageUrl: 'https://via.placeholder.com/150',
  );

  ProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider.builder(
              itemCount: 5,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  width: 150,
                  height: 150,
                  color: Colors.red,
                );
              },
              options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                  autoPlayInterval: const Duration(milliseconds: 2500),
                  enlargeFactor: 0.6,
                  viewportFraction: 0.6,
                  pauseAutoPlayOnTouch: true),
            ),
            // Center(
            //   child: Image.network(
            //     product.imageUrl,
            //     height: 200,
            //     width: 200,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${product.price}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 16),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String id;
  final String name;
  final double price;
  final String description;
  final String imageUrl;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.imageUrl});
}
