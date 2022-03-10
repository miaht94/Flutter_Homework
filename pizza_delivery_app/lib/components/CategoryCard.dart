import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_delivery_app/constant.dart';
import 'package:pizza_delivery_app/model/category.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    Key ? key,
    required this.category,
    required this.cardIndex,
    required this.onTap
  }): super(key: key);
  int cardIndex;
  Category category;
  void Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
    GestureDetector(
      onTap: () {
        onTap(cardIndex);
      },
      child: Padding(
      padding: EdgeInsets.only(left: size.width / 18 - 10, top: 10), 
      child: Container(
        // color: kPrimaryColor,
        width: size.width / 3.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: category.isActivating ? kPrimaryColor : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(1,1),
              blurRadius: 5
            )
          ]
        ),
        child: Column(children: [
          Padding(padding: EdgeInsets.only(top: 20),
            child: Image.asset(category.imagePath, width: 60)  
          ),
          Padding(padding: EdgeInsets.all(6)),
          Text(category.title, style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w500)),
          Padding(padding: EdgeInsets.all(8)),
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle, color: category.isActivating ? Colors.white : Color.fromRGBO(242, 108, 104, 1)),
            child: SvgPicture.asset('assets/icons/right.svg', width: 8, color: Colors.black.withOpacity(0.8),)
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.center),
      )
    ),
    );
    

  }

}