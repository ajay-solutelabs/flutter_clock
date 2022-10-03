import 'dart:async';

import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';

class TimeInHourAndMinute extends StatefulWidget {
  const TimeInHourAndMinute({Key? key}) : super(key: key);

  @override
  State<TimeInHourAndMinute> createState() => _TimeInHourAndMinuteState();
}

class _TimeInHourAndMinuteState extends State<TimeInHourAndMinute> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(_timeOfDay.minute != TimeOfDay.now().minute){
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String _period = _timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${_timeOfDay.hourOfPeriod < 10 ? '0${_timeOfDay.hourOfPeriod}' : '${_timeOfDay.hourOfPeriod}'}:${_timeOfDay.minute < 10 ? '0${_timeOfDay.minute}' : '${_timeOfDay.minute}'}',
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          width: 5,
        ),
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              _period,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
              ),
            )),
      ],
    );
  }
}