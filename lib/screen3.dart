import 'package:flutter/material.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Profile',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.pink.shade200,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'User full Name',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),

              // Profile options
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    profileRow(Icons.person_outline, 'My Profile'),
                    profileRow(Icons.shopping_bag_outlined, 'My Orders'),
                    profileRow(Icons.favorite_border, 'My Favorites'),
                    profileRow(Icons.settings_outlined, 'Settings'),
                  ],
                ),
              ),

              SizedBox(height: 30),
              Divider(thickness: 1, color: Colors.pink.shade100),
              SizedBox(height: 10),

              // Logout
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout, color: Colors.black54),
                  SizedBox(width: 10),
                  Text(
                    'Log Out',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ],
              ),

              Spacer(),

              // Bottom Navigation Bar (Not functional)
              Container(
                height: 70,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home_outlined, color: Colors.black),
                        Text('Home'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_outlined, color: Colors.black),
                        Text('Items'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_outline, color: Colors.pink),
                        Text('Profile', style: TextStyle(color: Colors.pink)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.pink,
            onPressed: () {},
            child: Icon(Icons.shopping_bag_outlined, color: Colors.white),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ),
      ),
    );
  }

  Widget profileRow(IconData icon, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.black),
              SizedBox(width: 10),
              Text(text, style: TextStyle(fontSize: 18)),
            ],
          ),
          Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black45),
        ],
      ),
    );
  }
}