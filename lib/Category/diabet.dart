
import 'package:flutter/material.dart';
import 'datafile.dart'; 

class DiabetesCarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Diabetes Care'),
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/home.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                'Diabetic Diet',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryCard(
                    title: 'Sugar\nSubstitute',
                    imageUrl: 'assets/obat1.png',
                  ),
                  CategoryCard(
                    title: 'Juices &\nVinegars',
                    imageUrl: 'assets/obat1.png',
                  ),
                  CategoryCard(
                    title: 'Vitamins\nMedicines',
                    imageUrl: 'assets/obat1.png',
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'All Products',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length, 
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    title: product.title,
                    price: product.price,
                    rating: product.rating,
                    imageUrl: product.imageUrl,
                    isSale: product.isSale,
                    isHot: product.isHot,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
