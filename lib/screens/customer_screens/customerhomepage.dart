import 'package:flutter/material.dart';
import 'package:helpile_capstone/screens/customer_screens/nearbyserviceproviders.dart';
import 'package:helpile_capstone/screens/customer_screens/scheduledappointment.dart';
import 'package:helpile_capstone/screens/customer_screens/servicecategorypage.dart';
import 'package:helpile_capstone/screens/widgets/avatar/circleavatar.dart'; // Assuming this file contains CustomCircleAvatar
import 'package:helpile_capstone/screens/widgets/title/sectiontitle.dart';
import 'package:models/models.dart';

import '../widgets/cardss/schedulepreviewcard.dart';
import 'customerprofilepage.dart';

class CustomerHomepage extends StatelessWidget {
  const CustomerHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 5),
                Text(
                  "Kitchener",
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(width: 5),
                Icon(Icons.expand_more)
              ],
            ),
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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _ServiceCategory(),
            SizedBox(height: 10),
            _MySchedule(),
            SizedBox(height: 10),
            _NearbyServiceProviders(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerProfilePage()));
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _ServiceCategory extends StatelessWidget {
  const _ServiceCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SectionTitle(
            title: "Categories",
            action: "see all",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Servicecategorypage()),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: Services.values.take(3).map((category) {
              return Container(
                padding: EdgeInsets.all(14),
                child: CustomCircleAvatar(
                  icon: category.icon,
                  label: category.name,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _MySchedule extends StatelessWidget {
  const _MySchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SectionTitle(
            title: "My Schedule",
            action: "see all",
            onPressed: () {
              // Show the pop-up message
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('My Appointments'),
                  content: Text('You have no appointments scheduled.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          SchedulePreviewCard(),
        ],
      ),
    );
  }
}

class _NearbyServiceProviders extends StatelessWidget {
  const _NearbyServiceProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter service providers based on distance
    final nearbyServiceProviders = ServiceProvidersList.where((provider) => provider.distance < 2.5).toList();

    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SectionTitle(
            title: "Nearby Service Providers",
            action: "see all",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Nearbyserviceproviders()),
              );
            },
          ),
          const SizedBox(height: 5),
          ListView.separated(
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final serviceProvider = nearbyServiceProviders[index];
              return Card(
                elevation: 4,
                margin:const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
            separatorBuilder: (context, index) {
              return const SizedBox(height: 8);
            },
            itemCount: nearbyServiceProviders.length,
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CustomerHomepage(),
    debugShowCheckedModeBanner: false,
  ));
}
