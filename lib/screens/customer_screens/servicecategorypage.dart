import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

import '../widgets/avatar/circleavatar.dart';

class Servicecategorypage extends StatelessWidget {
  const Servicecategorypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Categories'),
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: GridView.count(
          crossAxisCount: 3,
          children: Services.values.map((category) {
            return Container(
              padding: EdgeInsets.all(14),
              child: CustomCircleAvatar(
                icon: category.icon,
                label: category.name,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
