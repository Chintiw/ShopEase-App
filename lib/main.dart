import 'package:flutter/material.dart';
import 'search_malls_screen.dart';
import 'shop_details_screen.dart';
import 'product_details_screen.dart'; // Import product details

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homepage Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        '/search': (context) => SearchMallsScreen(),
        '/shopDetails': (context) => ShopDetailsScreen(
            mall: ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>),
        '/productDetails': (context) => ProductDetailsScreen(
            shopName: ModalRoute.of(context)!.settings.arguments
                as String), // Added product details
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.network(
                'https://via.placeholder.com/200',
                fit: BoxFit.cover,
                errorBuilder: (
                  BuildContext context,
                  Object exception,
                  StackTrace? stackTrace,
                ) {
                  return const Icon(
                    Icons.image_not_supported,
                    size: 80,
                    color: Colors.grey,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: _termsAccepted,
                  onChanged: (bool? value) {
                    setState(() {
                      _termsAccepted = value!;
                    });
                  },
                ),
                Text('I accept the Terms and Conditions'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _termsAccepted
                  ? () {
                      Navigator.pushNamed(context, '/search');
                    }
                  : null,
              child: Text('Get Started'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
