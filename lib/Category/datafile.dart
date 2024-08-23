import 'package:flutter/material.dart';

class Product {
  final String title;
  final String price;
  final String rating;
  final String imageUrl;
  final bool isSale;
  final bool isHot;

  Product({
    required this.title,
    required this.price,
    required this.rating,
    required this.imageUrl,
    this.isSale = false,
    this.isHot = false,
  });
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CategoryCard({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Center(
            child: Image.asset(
              imageUrl,
              height: 100,
              width: 80,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 42, 41, 41),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String rating;
  final String imageUrl;
  final bool isSale;
  final bool isHot;

  const ProductCard({
    required this.title,
    required this.price,
    required this.rating,
    required this.imageUrl,
    this.isSale = false,
    this.isHot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (isSale)
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'SALE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        if (isHot)
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                '15% OFF',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

final List<Product> products = [
  Product(
    title: 'Accu-check Active Test Strip',
    price: 'Rp 112.000',
    rating: '4.2',
    imageUrl: 'assets/obat1.png',
    isSale: true,
    isHot: false,
  ),
  Product(
    title: 'Omron HEM-8712 BP Monitor',
    price: 'Rp 150.000',
    rating: '4.5',
    imageUrl: 'assets/obat1.png',
    isSale: false,
    isHot: true,
  ),
  Product(
    title: 'OneTouch Ultra Test Strip',
    price: 'Rp 120.000',
    rating: '4.3',
    imageUrl: 'assets/obat1.png',
    isSale: false,
    isHot: false,
  ),
  Product(
    title: 'Contour Plus Test Strip',
    price: 'Rp 130.000',
    rating: '4.4',
    imageUrl: 'assets/obat1.png',
    isSale: false,
    isHot: false,
  ),
];
