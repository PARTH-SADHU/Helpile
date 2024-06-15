import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpile_capstone/screens/serviceprovider_screens/servicepsignuppage.dart';
import '../customer_screens/customerhomepage.dart';
import '../customer_screens/customersignuppage.dart';
import '../onboarding_screens.dart';
import '../widgets/custommaterialbutton.dart';

class Serviceploginpage extends StatelessWidget {
  const Serviceploginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => OnboardingScreens(),
              ),
            );

          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeInUp(
                        duration: Duration(milliseconds: 1000),
                        child: Text(
                          "Service Provider Login",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      FadeInUp(
                        duration: Duration(milliseconds: 1200),
                        child: Text(
                          "Login to your account",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        FadeInUp(
                          duration: Duration(milliseconds: 1200),
                          child: makeInput(label: "Email"),
                        ),
                        FadeInUp(
                          duration: Duration(milliseconds: 1300),
                          child: makeInput(label: "Password", obscureText: true),
                        ),
                      ],
                    ),
                  ),
                  FadeInUp(
                    duration: Duration(milliseconds: 1400),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.black),
                        ),
                        child: CustomMaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CustomerHomepage()),
                            );
                          },
                          text: "Login",
                          height: 60,
                          borderRadius: 50,
                          color: Colors.greenAccent,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          key: UniqueKey(), // Add a key if needed
                        ),
                      ),
                    ),
                  ),

                  FadeInUp(
                    duration: const Duration(milliseconds: 1500),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have an account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Servicepsignuppage()),
                            );

                          },
                          child: Text(
                            " Sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FadeInUp(
              duration: Duration(milliseconds: 1200),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget makeInput({required String label, bool obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
      SizedBox(height: 5),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
        ),
      ),
      SizedBox(height: 30),
    ],
  );
}


class FadeInUp extends StatefulWidget {
  final Widget child;
  final Duration duration;

  FadeInUp({required this.child, required this.duration});

  @override
  _FadeInUpState createState() => _FadeInUpState();
}

class _FadeInUpState extends State<FadeInUp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: _offsetAnimation,
        child: widget.child,
      ),
    );
  }
}
