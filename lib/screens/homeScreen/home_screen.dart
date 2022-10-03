import 'package:flutter/material.dart';
import 'package:flutter_clock/screens/homeScreen/widget/buildAppBbarButton.dart';
import 'package:flutter_clock/screens/homeScreen/widget/home_screen_body.dart';
import 'package:flutter_clock/utils/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        actions: [
          buildAppBarButton(context),
        ],
      ),
      body: homeScreenBody(context),
    );
  }
}
