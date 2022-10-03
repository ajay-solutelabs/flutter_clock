import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_clock/screens/homeScreen/widget/digital_clock.dart';
import 'package:flutter_clock/utils/constants.dart';
import 'package:flutter_clock/utils/size_config.dart';

Widget homeScreenBody(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: Column(
      children: [
        Text(
          'Sambalpur, Odisha',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const TimeInHourAndMinute(),
        const AnalogClock(),
      ],
    ),
  );
}

class AnalogClock extends StatefulWidget {
  const AnalogClock({Key? key}) : super(key: key);

  @override
  State<AnalogClock> createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 0),
                    color: kShadowColor.withOpacity(0.14),
                    blurRadius: 64),
              ]),
          child: Transform.rotate(
            angle: -pi/2,
            child: CustomPaint(
              painter: ClockPainter(context: context, dateTime: _dateTime),
            ),
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  ClockPainter({required this.context, required this.dateTime});
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    Paint dotPainter = Paint()
      ..color = Theme.of(context).primaryIconTheme.color!;

    /// Minute calculation
    double minuteX = centerX + size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180);
    double minuteY = centerY + size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180);

    /// Minute line
    canvas.drawLine(
        center,
        Offset(minuteX, minuteY),
        Paint()
          ..color = Theme.of(context).accentColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10);

    /// hour calculation
    double hourX = centerX + size.width * 0.3 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerY + size.width * 0.3 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    ///hour line
    canvas.drawLine(
        center,
        Offset(hourX, hourY),
        Paint()
          ..color = Theme.of(context).colorScheme.secondary
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10);

    /// second calculation
    double secondX = centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);
    double secondY = centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);

    /// second line
    canvas.drawLine(center, Offset(secondX, secondY),
        Paint()..color = Theme.of(context).primaryColor);

    /// center dot of the clock
    canvas.drawCircle(center, 24, dotPainter);
    canvas.drawCircle(
        center, 23, Paint()..color = Theme.of(context).backgroundColor);
    canvas.drawCircle(center, 10, dotPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
