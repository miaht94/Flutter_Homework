import 'package:b12_navigator_routing/body.dart';
import 'package:b12_navigator_routing/header.dart';
import 'package:b12_navigator_routing/plant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

import 'constant.dart';
import 'plant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key ? key
  }): super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key ? key,
    required this.title
  }): super(key: key);
  final String title;
  @override
  State < StatefulWidget > createState() {
    return _MyHomePage(title: title);
  }

}

class _MyHomePage extends State <MyHomePage> with SingleTickerProviderStateMixin {
  _MyHomePage({
    required this.title
  });
  
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  bool animated = false;
  late AnimationController animationController;
  late ScrollController listviewScrollControler;
  @override
  void initState() {
    animationController = AnimationController(duration: Duration(milliseconds: 200), vsync: this)..addListener(() {print(animationController.value);});
    listviewScrollControler = ScrollController()..addListener(() {
      // print(listviewScrollControler.offset);

      if (!animated && listviewScrollControler.offset > 10) {
        animated = true;
        animationController.forward();
      }
      if (animated && listviewScrollControler.offset <= 10) {
        animated = false;
        animationController.reverse();
      }

     });
     super.initState();
  }

  void listviewScrollCallback() {
    
  }

  Widget build(BuildContext context) {
    List < Plant > plants = Plant.initListProduct();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:
      Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            MainBody(plants: plants, listviewScrollController: listviewScrollControler,),
            AnimatedHeader(animationController: animationController),
          ]),
      )

    );
  }
}