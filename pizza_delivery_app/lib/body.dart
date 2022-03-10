import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_delivery_app/components/CategoryCard.dart';
import 'package:pizza_delivery_app/components/FoodCard.dart';
import 'package:scoped_model/scoped_model.dart';

import 'model/category.dart';
import 'model/food.dart';

class Body extends StatefulWidget {
  Body({
    Key ? key,
    required this.primaryScrollController
  }): super(key: key);
  ScrollController primaryScrollController;
  @override
  State < StatefulWidget > createState() {
    return _Body(primaryScrollController: primaryScrollController);
  }

}

class _Body extends State < Body > {
  _Body({required this.primaryScrollController});
  ScrollController primaryScrollController;
  int _choosenCategory = 0;
  List<Food> foods = Food.sampleFood();
  Future<List<Food>> future = Food.fetchFoods();
  late List<Food> foods_;
  List<Category> categories = Category.getSampleCategories();
  @override
  void initState() {
    setState(() {
      _choosenCategory = 0;
    });
    super.initState();
  }

  void onTapCate(int index) {
    categories[_choosenCategory].isActivating = false;
    categories[index].isActivating = true;
    _choosenCategory = index;
  }

  void onTapStar(int index) {
    foods[index].stared = !foods[index].stared;
  }
  
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return
    CustomScrollView(
      controller: primaryScrollController,
      slivers: [
      SliverList(
        delegate: SliverChildListDelegate([
          Padding(padding: EdgeInsets.only(top: size.height / 3, left: size.width / 18, right: size.width / 18),
            child: Text("Category", style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold))
          ),

          Container(child:
            ListView.builder(scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ScopedModel<Category>(model: categories[index],
                  child: ScopedModelDescendant<Category>(builder: (context, child, model) { return CategoryCard(category: model, cardIndex: index, onTap: onTapCate,);}),
                );
              },
              itemCount: categories.length,
              padding: EdgeInsets.symmetric(vertical: 6),
            ),
            height: size.height / 3.4,
          ),
           Padding(
              padding: EdgeInsets.only(top: 10, left: size.width / 18, right: size.width / 18),
              child: Text("Popular", style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 18))
           ),
           Text("data from server"),
           FutureBuilder<List<Food>>(future: future, builder: (context, snapshot) {
             
             if (snapshot.hasError) print(snapshot.error);
             else {
               print(snapshot.data);
             }
             return snapshot.hasData ? Container(
             height: size.height/2,
             child: ListView.builder(
               itemBuilder: (context, index) {
                 return ScopedModel<Food>(model: snapshot.data?[index], child: 
                   FoodCard()
                  ); 
               },
               itemCount: foods.length,
             ),
           ): Container();
           },),
           Text("data hardcode"),
           Container(
             height: size.height/2,
             child: ListView.builder(
               itemBuilder: (context, index) {
                 return ScopedModel<Food>(model: foods[index], child: 
                   FoodCard()
                  ); 
               },
               itemCount: foods.length,
             ),
           )
           
        ])
      )
    ], );

  }

}