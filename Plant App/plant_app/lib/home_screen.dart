import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import 'package:plant_app/constant.dart';
import "body.dart";
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: onPressMenu,
          splashRadius: 0.0001,
          ),
      ),
      body: Body(),
    );
  } 

  onPressMenu() {

  }
}