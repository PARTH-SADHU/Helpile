import 'package:flutter/material.dart';
import 'package:models/models.dart'; // Import your model file here

class Nearbyserviceproviders extends StatelessWidget {
  const Nearbyserviceproviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter service providers based on distance
    final nearbyServiceProviders = ServiceProvidersList.where((provider) => provider.distance < 2.5).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black12,
        toolbarHeight: 100,
        title: const Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 4.0),
                Text(
                  "User",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),
              ],
            ),
            Spacer(),
            _LocationDropdown(), // Custom widget for the dropdown
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search for Service Providers...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                suffixIcon: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.black,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: nearbyServiceProviders.length,
        itemBuilder: (context, index) {
          final serviceProvider = nearbyServiceProviders[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(serviceProvider.imageUrl),
              ),
              title: Text(
                serviceProvider.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceProvider.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(
                        serviceProvider.rating.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.location_on, color: Colors.grey, size: 16),
                      SizedBox(width: 4),
                      Text(
                        '${serviceProvider.distance} km',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Text(
                '\$${serviceProvider.charges.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              onTap: () {
                // Implement onTap action if needed
              },
            ),
          );
        },
      ),
    );
  }
}
class _LocationDropdown extends StatelessWidget {
  const _LocationDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        // Handle the selection
        print('Selected location: $value');
      },
      itemBuilder: (BuildContext context) {
        return <String>['Kitchener', 'Waterloo', 'Cambridge'].map((String location) {
          return PopupMenuItem<String>(
            value: location,
            child: Text(location),
          );
        }).toList();
      },
      child: Row(
        children: const [
          Icon(Icons.location_on),
          SizedBox(width: 5),
          Text(
            "Kitchener",
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(width: 5),
          Icon(Icons.expand_more),
        ],
      ),
    );
  }
}

