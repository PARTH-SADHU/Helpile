import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helpile_capstone/screens/customer_screens/customerhomepage.dart';
import 'package:helpile_capstone/screens/customer_screens/customerloginpage.dart'; // Import ServicePLoginPage
import 'package:helpile_capstone/screens/serviceprovider_screens/serviceploginpage.dart';
import 'package:helpile_capstone/screens/widgets/custommaterialbutton.dart';

import 'content_model.dart';

class OnboardingScreens extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<OnboardingScreens> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        contents[i].image,
                        height: 300,
                      ),
                      Text(
                        contents[i].title,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        contents[i].discription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
                  (index) => buildDot(index, context),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            child: CustomMaterialButton(
              onPressed: () {
                if (currentIndex == 0) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CustomerLoginPage(),
                    ),
                  );
                } else if (currentIndex == 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Serviceploginpage(), // Navigate to ServicePLoginPage
                    ),
                  );
                }
              },
              text: currentIndex == 0 ? "Customer Login" : "Service Provider Login",
              height: 60,
              borderRadius: 50,
              color: Colors.greenAccent,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              key: UniqueKey(), // Add a key if needed
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
