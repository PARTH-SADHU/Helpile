import 'package:flutter/material.dart';
import 'package:models/models.dart'; // Import your model file here

class Nearbyserviceproviders extends StatelessWidget {
  const Nearbyserviceproviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter service providers based on distance
    final nearbyServiceProviders = ServiceProvidersList.where((provider) => provider.distance < 2.5).toList();

    return Scaffold(
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
