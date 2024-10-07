import 'package:flutter/material.dart';

class SelectAirportScreen extends StatefulWidget {
  const SelectAirportScreen({super.key});

  @override
  State<SelectAirportScreen> createState() => _SelectAirportScreenState();
}

class _SelectAirportScreenState extends State<SelectAirportScreen> {
  final List<Map<String, String>> airports = [
    {"city": "Abidjan", "name": "Port Bouet Airport", "code": "ABJ"},
    {"city": "Abuja", "name": "Nnamdi Azikiwe Airport", "code": "ABV"},
    {"city": "Accra", "name": "Kotoka Airport", "code": "ACC"},
    {"city": "Ad Dammam", "name": "King Fahd Airport", "code": "DMM"},
    {
      "city": "Addis Ababa",
      "name": "Bole International Airport",
      "code": "ADD"
    },
    {"city": "Antarivo", "name": "Ivato Airport", "code": "TNR"},
  ];

  List<Map<String, String>> filteredAirports = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredAirports = airports;
  }

  void filterSearch(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredAirports = airports
            .where((airport) =>
                airport["city"]!.toLowerCase().contains(query.toLowerCase()) ||
                airport["name"]!.toLowerCase().contains(query.toLowerCase()) ||
                airport["code"]!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        filteredAirports = airports;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Select Airport',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Cancel button action
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(238, 238, 238, 1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(238, 238, 238, 1),
                    blurRadius: 5,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                onChanged: filterSearch,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Direct Airports',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredAirports.length,
              itemBuilder: (context, index) {
                final airport = filteredAirports[index];
                return Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.flight_takeoff),
                      title: Text('${airport["city"]}, ${airport["name"]}'),
                      subtitle: Text('(${airport["code"]})'),
                      onTap: () {
                        // Pass the selected airport back
                        Navigator.pop(context,
                            '${airport["code"]} ${airport["city"]} ${airport["name"]}');
                      },
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
