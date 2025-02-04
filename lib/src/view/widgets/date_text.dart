import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

class DateText extends StatelessWidget {
  final DateTime dateTime;
  const DateText({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Text(dateTime.format('l, F d, Y'));
  }
}
