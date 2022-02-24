import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:plant_app/constant.dart';

class Cards extends StatelessWidget {
  const Cards({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
    Container(
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.only(left: kDefaultPadding),
      width: size.width,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: size.height*0.25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("assets/images/image_1.png"),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        color: kPrimaryColor.withOpacity(0.3),
                        blurRadius: 20
                      )
                    ]
                  ),
                ),
                Expanded(
                  child: Container(
                    height: size.height*0.25,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(-6,10),
                            color: kPrimaryColor.withOpacity(0.3),
                            blurRadius: 20
                          )
                        ]
                      ),
                    child: Column(children: [
                      Text("Just a plant", 
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5?.copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eleifend malesuada ligula. Integer eget augue at quam vestibulum",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: kPrimaryColor.withOpacity(0.7), fontStyle: FontStyle.italic,)
                        )
                    ])
                    
                  )
                )
                
              ]
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: size.height*0.25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("assets/images/image_2.png"),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        color: kPrimaryColor.withOpacity(0.3),
                        blurRadius: 20
                      )
                    ]
                  ),
                ),
                Expanded(
                  child: Container(
                    height: size.height*0.25,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(-6,10),
                            color: kPrimaryColor.withOpacity(0.3),
                            blurRadius: 20
                          )
                        ]
                      ),
                    child: Column(children: [
                      Text("Just a plant", 
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5?.copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eleifend malesuada ligula. Integer eget augue at quam vestibulum",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: kPrimaryColor.withOpacity(0.7), fontStyle: FontStyle.italic,)
                        )
                    ])
                    
                  )
                )
                
              ]
            ),
          ),
        ]),
    ); 
    
  }
  
}