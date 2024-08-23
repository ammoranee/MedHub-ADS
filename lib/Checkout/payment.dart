import 'package:flutter/material.dart';

import 'order_success.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedPaymentMethod = 'OVO';
  String selectedAddress = 'Home'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Checkout',
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
              _buildHeader(),
              SizedBox(height: 16),
              _buildDeliveryAddressSection(),
              SizedBox(height: 16),
              _buildPaymentMethodSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '2 Items in your cart',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'TOTAL',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Text(
              'Rp 185.000',
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDeliveryAddressSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Delivery Address', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      _buildAddressTile('Home', '(031) 555-024\nJL Rajawali No. 02, Surabaya'),
      SizedBox(height: 8),
      _buildAddressTile('Office', '(031) 555-024\nJL Gajah Mada No. 05, Sidoarjo'),
      SizedBox(height: 8),
      Align(
        alignment: Alignment.centerRight, // Mengatur agar tulisan "Add Address" berada di kanan
        child: Text(
          '+ Add Address',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}

  Widget _buildAddressTile(String addressType, String addressDetails) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: selectedAddress == addressType ? Colors.blue : Colors.grey[300]!,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Radio<String>(
                value: addressType,
                groupValue: selectedAddress,
                activeColor: Colors.blue,
                onChanged: (String? value) {
                  setState(() {
                    selectedAddress = value!;
                  });
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(addressType, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(addressDetails, style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ],
          ),
          Icon(Icons.edit, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment method', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        _buildPaymentMethodTile('OVO', 'assets/ovo_icon.png'),
        _buildPaymentMethodTile('Dana', 'assets/ovo_icon.png'),
        _buildPaymentMethodTile('ShopeePay', 'assets/ovo_icon.png'),
        _buildPaymentMethodTile('GoPay', 'assets/ovo_icon.png'),
      ],
    );
  }

  Widget _buildPaymentMethodTile(String methodName, String assetPath) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Image.asset(assetPath, height: 30, width: 30), 
          SizedBox(width: 16),
          Expanded(
            child: Text(methodName, style: TextStyle(fontSize: 16)),
          ),
          Radio<String>(
            value: methodName,
            groupValue: selectedPaymentMethod,
            activeColor: Colors.blue,
            onChanged: (String? value) {
              setState(() {
                selectedPaymentMethod = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderSuccessPage(),
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
          'Pay Now Rp 185.000',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
