import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/cards.dart';
import 'package:plant_app/constant.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height * 0.2,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: kDefaultPadding,
                  bottom: 36,
                  right: kDefaultPadding - 10
                ),
                height: size.height * 0.2 - 27,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36), bottomRight: Radius.circular(36))
                ),
                child: Row(
                  children: [
                    Expanded(
                      child:
                        Text("Heyyo Bach!",
                          style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white, fontWeight: FontWeight.bold), 
                        ), 
                    ),
                    Image.asset('assets/images/logo.png')
                  ],
                ) 
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: 54,
                  margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    boxShadow: [BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50.0,
                      color: kPrimaryColor.withOpacity(0.24)
                    )]
                  ),
                  child:
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search ...",
                                suffixIcon: const Icon(Icons.search, color: kPrimaryColor,),
                                hintStyle: TextStyle(
                                  color: kPrimaryColor.withOpacity(0.5),
                                ),
                              ),
                              
                            ),
                          ),
                          // SvgPicture.asset("assets/icons/search.svg")
                          
                        ],
                      )
                      
                  )
              )]
          )
        ),
        const Cards()
      ]
    );
  }
}