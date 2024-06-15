import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduledAppointment extends StatelessWidget {
  final List<Appointment>? appointments;

  const ScheduledAppointment({Key? key, this.appointments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (appointments != null && appointments!.isNotEmpty) {
      // If appointments are scheduled, display them as tiles
      return Scaffold(
        body: ListView.builder(
          itemCount: appointments!.length,
          itemBuilder: (context, index) {
            final appointment = appointments![index];
            return ListTile(
              title: Text(appointment.title),
              subtitle: Text(appointment.dateTime.toString()),
              // Add more details here if needed
            );
          },
        ),
      );
    } else {
      // If no appointments are scheduled, display a message
      return Center(
        child: Text('No appointments scheduled'),
      );
    }
  }
}

class Appointment {
  final String title;
  final DateTime dateTime;

  const Appointment({required this.title, required this.dateTime});
}
