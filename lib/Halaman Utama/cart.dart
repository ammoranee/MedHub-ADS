import 'package:flutter/material.dart';
import '/Checkout/payment.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Your cart',
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCartItems(),
              SizedBox(height: 16),
              Divider(thickness: 1),
              SizedBox(height: 16),
              _buildCouponSection(),
              SizedBox(height: 16),
              Divider(thickness: 1),
              SizedBox(height: 16),
              _buildPaymentSummary(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildCartItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '2 Items in your cart',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Text(
              '+ Add more',
              style: TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 16),
        _buildCartItem('Sugar free gold', 'bottle of 500 pellets', 'Rp 25.000', 1),
        SizedBox(height: 16),
        _buildCartItem('Sugar free gold', 'bottle of 500 pellets', 'Rp 18.000', 1),
      ],
    );
  }

  Widget _buildCartItem(String title, String subtitle, String price, int quantity) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200],
          ),
          child: Icon(Icons.image, size: 40),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(subtitle, style: TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(price, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.remove, color: Colors.blue),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('$quantity', style: TextStyle(fontSize: 16)),
                ),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.add, color: Colors.blue),
                    onPressed: () {},
                  ),
                ),
              ],
            )
          ],
        ),
        IconButton(
          icon: Icon(Icons.close, color: Colors.grey),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildCouponSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.local_offer_outlined, color: Colors.green),
              SizedBox(width: 8),
              Text('1 Coupon applied', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            ],
          ),
          IconButton(
            icon: Icon(Icons.close, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Summary', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        _buildSummaryRow('Order Total', 'Rp 228.800'),
        _buildSummaryRow('Items Discount', '- Rp 28.800'),
        _buildSummaryRow('Coupon Discount', '- Rp 15.800'),
        _buildSummaryRow('Shipping', 'Free'),
        Divider(thickness: 1),
        _buildSummaryRow('Total', 'Rp 185.000', isTotal: true),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.black : Colors.grey,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildBottomBar(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(16),
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CheckoutPage(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Color.fromRGBO(7, 45, 102, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Text(
        'Place Order @ Rp 185.000',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}
}
