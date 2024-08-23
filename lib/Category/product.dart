import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sugar Free Gold Low Calories'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.network(
                    'https://via.placeholder.com/150', // Ganti dengan URL gambar asli
                    height: 150,
                  ),
                  SizedBox(height: 8),
                  Text('Rp 56.000', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('Etiam mollis'),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Add to cart'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text('Package size', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPackageOption(context, 'Rp 252.000', '500 pellets', true),
                _buildPackageOption(context, 'Rp 108.000', '110 pellets', false),
                _buildPackageOption(context, 'Rp 168.000', '300 pellets', false),
              ],
            ),
            SizedBox(height: 16),
            Text('Product Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisl dolor. Nulla facilisi. '
              'Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar '
              'rhoncus. Etiam et nisi aliquet, accumsan nisi sit.',
            ),
            SizedBox(height: 16),
            Text('Rating and Reviews', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('4.4', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRatingBar(5, 67),
                    _buildRatingBar(4, 20),
                    _buildRatingBar(3, 6),
                    _buildRatingBar(2, 5),
                    _buildRatingBar(1, 2),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Divider(),
            _buildReview(),
            SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text('GO TO CART'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPackageOption(BuildContext context, String price, String size, bool selected) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: selected ? Colors.blue : Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            price,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(size),
      ],
    );
  }

  Widget _buildRatingBar(int stars, int percent) {
    return Row(
      children: [
        Text('$stars'),
        SizedBox(width: 4),
        Icon(Icons.star, color: Colors.amber, size: 16),
        SizedBox(width: 8),
        Stack(
          children: [
            Container(
              width: 100,
              height: 10,
              color: Colors.grey[300],
            ),
            Container(
              width: percent.toDouble(),
              height: 10,
              color: Colors.amber,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildReview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Lorem Hoffman', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('05 August 2024'),
        SizedBox(height: 8),
        Text(
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisl dolor. Nulla facilisi. '
          'Nunc risus massa, gravida id egestas a.',
        ),
      ],
    );
  }
}
