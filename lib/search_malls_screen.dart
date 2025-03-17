import 'package:flutter/material.dart';
import 'shop_details_screen.dart';

// ... (SearchMallsScreen code remains the same)
class SearchMallsScreen extends StatefulWidget {
  @override
  _SearchMallsScreenState createState() => _SearchMallsScreenState();
}

class _SearchMallsScreenState extends State<SearchMallsScreen> {
  List<Map<String, dynamic>> malls = [
    {
      'name': 'South City Mall',
      'location': 'Prince Anwar Shah Road, Kolkata',
      'shops': ['Pantaloons', 'Shoppers Stop', 'INOX', 'Starbucks'],
    },
    {
      'name': 'Quest Mall',
      'location': 'Syed Amir Ali Avenue, Kolkata',
      'shops': ['Zara', 'H&M', 'Rolex', 'Chai Break'],
    },
    {
      'name': 'Acropolis Mall',
      'location': 'Rajdanga Main Road, Kolkata',
      'shops': ['Reliance Trends', 'PVR', 'KFC', 'Wow! Momo'],
    },
    {
      'name': 'City Centre Salt Lake',
      'location': 'Salt Lake, Kolkata',
      'shops': ['Spencer\'s', 'Adidas', 'Fun Cinemas', 'CCD'],
    },
    {
      'name': 'Mani Square',
      'location': 'EM Bypass, Kolkata',
      'shops': ['Big Bazaar', 'Max', 'Cinemax', 'Barista'],
    },
  ];

  List<Map<String, dynamic>> filteredMalls = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredMalls = List.from(malls);
  }

  void _filterMalls(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredMalls = List.from(malls);
      } else {
        filteredMalls = malls
            .where(
              (mall) =>
                  mall['name']!.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Malls')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: _filterMalls,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredMalls.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredMalls[index]['name']!),
                  subtitle: Text(filteredMalls[index]['location']!),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/shopDetails',
                      arguments: filteredMalls[index],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
