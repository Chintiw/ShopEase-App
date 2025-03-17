import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String shopName;

  ProductDetailsScreen({required this.shopName});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String _scanBarcode = 'Unknown';
  String _manualBarcode = '';
  int _productCount = 0;
  Map<String, dynamic> _productDetails = {};

  final Map<String, Map<String, String>> _products = {
    '12345': {
      'name': 'Sample Product 1',
      'description': 'This is a sample product 1.'
    },
    '67890': {
      'name': 'Sample Product 2',
      'description': 'This is a sample product 2.'
    },
    // Add more sample products...
  };

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      if (!mounted) return;
      setState(() {
        _scanBarcode = barcodeScanRes;
        _manualBarcode = barcodeScanRes;
        _updateProductDetails(barcodeScanRes);
      });
    } catch (e) {
      setState(() {
        _scanBarcode = 'Failed to get platform version.';
      });
    }
  }

  void _updateProductDetails(String barcode) {
    if (_products.containsKey(barcode)) {
      setState(() {
        _productDetails = _products[barcode]!;
      });
    } else {
      setState(() {
        _productDetails = {};
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details - ${widget.shopName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () => scanBarcodeNormal(),
              child: Text('Start barcode scan'),
            ),
            Text('Scan result : $_scanBarcode\n'),
            TextField(
              decoration: InputDecoration(labelText: 'Manual Barcode'),
              onChanged: (value) {
                setState(() {
                  _manualBarcode = value;
                  _updateProductDetails(value);
                });
              },
            ),
            SizedBox(height: 20),
            if (_productDetails.isNotEmpty) ...[
              Text('Product: ${_productDetails['name']}'),
              Text('Description: ${_productDetails['description']}'),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      if (_productCount > 0) {
                        setState(() {
                          _productCount--;
                        });
                      }
                    },
                  ),
                  Text('$_productCount'),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        _productCount++;
                      });
                    },
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
