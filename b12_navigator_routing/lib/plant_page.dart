import 'dart:io';

import 'package:b12_navigator_routing/plant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'plant.dart';

class PlantPage extends StatelessWidget {
  PlantPage({
    Key ? key,
    required this.plant
  }): super(key: key);
  Plant plant;
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      body: PlantPageBody(plant: plant),
    );
  }
}

class PlantPageBody extends StatefulWidget {
  PlantPageBody({
    Key ? key,
    required this.plant
  }): super(key: key);
  Plant plant;
  @override
  State<StatefulWidget> createState() {
    return _PlantPageBody(plant: plant);
  }
  
}
 
class _PlantPageBody extends State<PlantPageBody> with SingleTickerProviderStateMixin{
  _PlantPageBody({required this.plant});
  final Plant plant;
  late AnimationController _animationController;
  late Animation<double> _animation;
  final GlobalKey testKey = GlobalKey(debugLabel: "debugLabel");
  static const CHANNEL = MethodChannel("BACH_CHANNEL");
  
  void _onClickTap() async {
    try {
      print(await CHANNEL.invokeMethod("getVersion"));
    } on PlatformException catch(e) {

    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 10));
    Tween<double> tween = Tween(begin: 100, end: 200);
    _animation = tween.animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
    Column(
      children: [
        Container(

          child: Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                key: testKey,
                height: 0.28 * size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                ),
              ),
              Positioned(
                width: size.width / 2.5,
                height: size.width / 2.5,
                top: 0.28 * size.height - size.width / 2.5 / 2,
                left: size.width / 2 - size.width / 2.5 / 2,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Hero(tag: plant.plantTitle, child: CircleAvatar(backgroundImage: Image.asset(plant.imagePath).image, ))),
              )
            ],
          )
        ),
        Padding(padding: EdgeInsets.only(bottom: size.width / 2.5 / 2)),
        Text(plant.plantTitle,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25)
        ),
        AnimatedBuilder(animation: _animation, builder: (context, _) {
          return Image.network('https://i1.sndcdn.com/avatars-zUGIpyyW010rJFrc-rdl0PQ-t240x240.jpg', width: _animation.value, height: _animation.value,);
        }),
        GestureDetector(child: Text("Click"), onTap: _onClickTap,)
        
      ],
    );
  }

}

class ScaleTransition extends AnimatedWidget {
  ScaleTransition({Key? key, required Animation<double> animation, required Widget child}) : this._child = child, super(key: key, listenable: animation);
  final Widget _child;
  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable as Animation<double>;
    return _child;
  }
}