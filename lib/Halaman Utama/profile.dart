import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text('My Profile'),
          ],
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Lorem Ipsum',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Welcome to MedHub',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(Icons.person, 'Private Account'),
                  Divider(thickness: 1, height: 24), // Divider added
                  _buildListTile(Icons.medical_services, 'My Consults'),
                  Divider(thickness: 1, height: 24), // Divider added
                  _buildListTile(Icons.receipt_long, 'My Orders'),
                  Divider(thickness: 1, height: 24), // Divider added
                  _buildListTile(Icons.credit_card, 'Billing'),
                  Divider(thickness: 1, height: 24), // Divider added
                  _buildListTile(Icons.help_outline, 'FAQ'),
                  Divider(thickness: 1, height: 24), // Divider added
                  _buildListTile(Icons.settings, 'Settings'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: const Color.fromRGBO(7, 45, 102, 1)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(7, 45, 102, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.add_box, color: Colors.white),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined, color: Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: Colors.grey),
            label: '',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  ListTile _buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
      },
    );
  }
}
