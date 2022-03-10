import 'package:flutter/material.dart';
import 'package:pizza_delivery_app/body.dart';
import 'package:pizza_delivery_app/constant.dart';
import 'package:pizza_delivery_app/header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        colorScheme: const ColorScheme.light().copyWith(primary: kDefaultBackgroundColor)
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  int _counter = 0;
  late ScrollController primaryScrollController;
  late AnimationController headerAnimation; 
  @override
  void initState() {
    super.initState();
    setState(() {
      
    });
    headerAnimation = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    primaryScrollController = ScrollController()..addListener(() {
      // print(primaryScrollController.offset);
      if (primaryScrollController.offset > 10) {
        headerAnimation.forward();
      } else {
        headerAnimation.reverse(); 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<Widget> kList = [Text("a"), Text("b")];
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Stack(children: [
        
        Body(primaryScrollController: primaryScrollController,),
        Header(animation: headerAnimation,),
      ],)
    );
  }
}
