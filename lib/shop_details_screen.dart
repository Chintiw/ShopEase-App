// lib/shop_details_screen.dart
import 'package:flutter/material.dart';

class ShopDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> mall;

  const ShopDetailsScreen({super.key, required this.mall});

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
              shopImage =
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ46SNqhJWrI2Ns15yo3iyB9njA8AbyuIAPew&';
            } else if (shopName == 'Shoppers Stop') {
              shopDescription = 'Department store';
              shopImage =
                  'https://www.chittorgarh.net/images/ipo/shoppers-stop-rights-issue.jpg';
            } else if (shopName == 'INOX') {
              shopDescription = 'Movie theater';
              shopImage =
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIy5eCbYFrljFsAt0_B84nzfOg0XvrZ8ZApQ&s';
            } else if (shopName == 'Starbucks') {
              shopDescription = 'Coffee shop';
              shopImage =
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5QgoP_chL5EYZVF1MkQ_UNEj1CFpebDow_w&s';
            }
          } else if (mall['name'] == 'Quest Mall') {
            if (shopName == 'Zara') {
              shopDescription = 'Fashion apparel';
              shopImage =
                  'https://brandlogos.net/wp-content/uploads/2022/04/zara-logo-brandlogos.net_.png';
            } else if (shopName == 'H&M') {
              shopDescription = 'Clothing and accessories';
              shopImage =
                  'https://brandslogos.com/wp-content/uploads/images/large/hm-logo-black-and-white-1.png';
            } else if (shopName == 'Rolex') {
              shopDescription = 'Luxury watches';
              shopImage ='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKNZULvPWYGHCTcU-9y7yMzvy-_ywE3VXI-w&s';
            } else if (shopName == 'Chai Break') {
              shopDescription = 'Cafe and snacks';
              shopImage =
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQydq8D9X_H6ZtSsvZb5EY1CI8wD_oeydZD6w&s';
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
