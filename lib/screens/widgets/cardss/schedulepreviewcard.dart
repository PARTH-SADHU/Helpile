import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchedulePreviewCard extends StatelessWidget {
  const SchedulePreviewCard({super.key});
  static const List<Color> previewCardColors = [

    Color(0xFFE0E0E0), // Grey 300
    Color(0xFFBDBDBD), // Grey 400
    Color(0xFF9E9E9E), // Grey 500
    Color(0xFF757575), // Grey 600
    Color(0xFF424242), // Grey 800
  ];




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: previewCardColors,

            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 120,
                child: Center(
                    child: Text(
                        "No appointments Scheduled",
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
                    )),
              )
            ],
          ),
        ),
        Container(
              height: 8,
          margin: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8)
          ),

    ),
        Container(
          height: 8,
          margin: EdgeInsets.symmetric(horizontal: 22),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8)
          ),

        )
      ],
    );
  }
}
