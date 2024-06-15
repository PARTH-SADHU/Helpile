import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helpile_capstone/screens/customer_screens/servicecategorypage.dart';
import 'package:helpile_capstone/screens/widgets/avatar/circleavatar.dart'; // Assuming this file contains CustomCircleAvatar
import 'package:helpile_capstone/screens/widgets/title/sectiontitle.dart';
import 'package:models/models.dart';

import '../widgets/cardss/schedulepreviewcard.dart';

class CustomerHomepage extends StatelessWidget {
  const CustomerHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        toolbarHeight: 100,
        title: const Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                "User",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4.0,
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Icon(Icons.location_on),
              SizedBox(
                width: 5,
              ),
              Text(
                "Kitchener",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.expand_more)
            ],
          ),
        ]),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Padding(
            padding: EdgeInsets.all(9),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search for Service Providers...",
                hintStyle: TextStyle(color: Colors.grey),
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
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
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
        ), // Example content for the AppBar
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _DoctorCategories(),
            SizedBox(
              height: 10,
            ),
            _MySchedule(),
            SizedBox(
              height: 10,
            ),
            _NearbyServiceProviders(),
          ], // Example content for the body
        ),
      ),
    );
  }
}

class _DoctorCategories extends StatelessWidget {
  const _DoctorCategories({super.key});

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
                MaterialPageRoute(
                    builder: (context) => const Servicecategorypage()),
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
  const _MySchedule({super.key});

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
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Servicecategorypage()),
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
  const _NearbyServiceProviders({Key? key});

  @override
  Widget build(BuildContext context) {
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
                MaterialPageRoute(builder: (context) => const Servicecategorypage()),
              );
            },
          ),
          const SizedBox(
            height: 5,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final serviceProvider = ServiceProvidersList[index];
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(serviceProvider.imageUrl),
                  ),
                  title: Text(
                    serviceProvider.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Custom color
                    ),
                  ),
                  subtitle: Text(
                    serviceProvider.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey, // Custom color
                    ),
                  ),
                  trailing: Text(
                    '\$${serviceProvider.charges.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Custom color
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
            itemCount: ServiceProvidersList.length,
          ),
        ],
      ),
    );
  }
}
