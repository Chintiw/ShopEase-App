// lib/shop_details_screen.dart
import 'package:flutter/material.dart';
import 'product_details_screen.dart';

class ShopDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> mall;

  ShopDetailsScreen({required this.mall});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mall['name']),
      ),
      body: ListView.builder(
        itemCount: (mall['shops'] as List).length,
        itemBuilder: (context, index) {
          final shopName = (mall['shops'] as List)[index];
          String shopDescription = ''; // Default description
          String shopImage = ''; // Default image

          // Sample data for shops (you'll likely replace this with a database or API)
          if (mall['name'] == 'South City Mall') {
            if (shopName == 'Pantaloons') {
              shopDescription = 'Apparel and accessories';
              shopImage = 'https://via.placeholder.com/150?text=Pantaloons';
            } else if (shopName == 'Shoppers Stop') {
              shopDescription = 'Department store';
              shopImage = 'https://via.placeholder.com/150?text=Shoppers+Stop';
            } else if (shopName == 'INOX') {
              shopDescription = 'Movie theater';
              shopImage = 'https://via.placeholder.com/150?text=INOX';
            } else if (shopName == 'Starbucks') {
              shopDescription = 'Coffee shop';
              shopImage = 'https://via.placeholder.com/150?text=Starbucks';
            }
          } else if (mall['name'] == 'Quest Mall') {
            if (shopName == 'Zara') {
              shopDescription = 'Fashion apparel';
              shopImage = 'https://via.placeholder.com/150?text=Zara';
            } else if (shopName == 'H&M') {
              shopDescription = 'Clothing and accessories';
              shopImage = 'https://via.placeholder.com/150?text=H&M';
            } else if (shopName == 'Rolex') {
              shopDescription = 'Luxury watches';
              shopImage = 'https://via.placeholder.com/150?text=Rolex';
            } else if (shopName == 'Chai Break') {
              shopDescription = 'Cafe and snacks';
              shopImage = 'https://via.placeholder.com/150?text=Chai+Break';
            }
          }
          // Add similar logic for other malls and shops...

          return ListTile(
              leading: shopImage.isNotEmpty
                  ? Image.network(shopImage, width: 50, height: 50)
                  : null, // Display image if available
              title: Text(shopName),
              subtitle: Text(shopDescription),
              onTap: () {
                Navigator.pushNamed(context, '/productDetails',
                    arguments: shopName);
              });
        },
      ),
    );
  }
}
