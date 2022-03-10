import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant.dart';

class Header extends AnimatedWidget {
  Header({
    Key ? key, required this.animation
  }): super(key: key, listenable: animation);
  Listenable animation;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    AnimationController controller = animation as AnimationController;
    print(controller.value);
    return
    Column(
      children: [
        Padding(padding: EdgeInsets.only(left: 10, top: 10, right: 10),
          child:
          Row(children: [
              CircleAvatar(
                backgroundImage: Image.asset("assets/images/profile.png").image,
                minRadius: 24,
                maxRadius: 24),
              Expanded(child: Container()),
              SvgPicture.asset('assets/icons/menu_button.svg', height: 14, )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        Expanded(child:
          Stack(
            children: [
              Positioned(
                top: 0,
                child: 
                Opacity(
                  opacity: 1 - controller.value, 
                  child: Container(
                    width: size.width,
                    height: size.height / 3,
                    padding: EdgeInsets.only(top: 0, left: size.width / 18, right: size.width / 18),
                    child: Column(children: [

                        Padding(padding: EdgeInsets.only(top: 20), ),
                        Text("Food", style: GoogleFonts.montserrat(fontSize: 16)),
                        Text("Delivery", style: GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.bold)),
                        Padding(padding: EdgeInsets.only(top: 10)),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    )
                  ),
                ),
              ),

              Positioned(
                top: size.height / 7 * (1-controller.value) > 0 ? size.height / 7 * (1-controller.value) : 10,
                left: size.width / 18 * (1-controller.value) > 0 ? size.width / 18 * (1-controller.value) : 10,
                right: size.width / 18 * (1-controller.value) > 0 ? size.width / 18 * (1-controller.value) : 10,
                // right: 0,
                child: Container(
                  height: size.height / 15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 5.0,
                      color: Colors.black.withOpacity(0.24)
                    )]
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child:
                  Row(children: [
                    SvgPicture.asset("assets/icons/search.svg"),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Flexible(
                      child: TextField(decoration: InputDecoration(
                        hintText: "Search ...",
                        border: InputBorder.none,
                      )),
                    )
                  ])
                )
              ),
            ],
          ), )
      ],
    );
  }
}