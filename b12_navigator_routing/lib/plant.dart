import 'package:scoped_model/scoped_model.dart';

class Plant extends Model {
  Plant(this._rating, this.plantTitle, this.imagePath, this.price);
  factory Plant.fromMap(Map < String, dynamic > json) {
    return Plant(json['rating'], json['plantTitle'], json['imagePath'], json['price']);
  }
  int _rating = 0;
  String plantTitle = "Undefined";
  String imagePath = "assets/images/image_1.png";
  String price = "1\$";

  int get rating {
    return _rating;
  }

  void setPrice(String price) {
    price = price;
  }

  void setRating(int rate) {
    _rating = rate;
    notifyListeners();
  }
  void setPlantTitle(String title) {
    plantTitle = title;
    notifyListeners();
  }
  void setImagePath(path) {
    imagePath = path;
    notifyListeners();
  }
  static List < Plant > initListProduct() {
    List < Plant > plants = < Plant > [];
    plants.add(Plant.fromMap({
      'plantTitle': "Plant 1",
      'rating': 1,
      'imagePath': "assets/images/image_1.png",
      'price': "10\$"
    }));
    plants.add(Plant.fromMap({
      'plantTitle': "Plant 2",
      'rating': 1,
      'imagePath': "assets/images/image_2.png",
      'price': "10\$"
    }));
    plants.add(Plant.fromMap({
      'plantTitle': "Plant 3",
      'rating': 1,
      'imagePath': "assets/images/image_3.png",
      'price': "10\$"
    }));
    plants.add(Plant.fromMap({
      'plantTitle': "Plant 4",
      'rating': 1,
      'imagePath': "assets/images/image_4.png",
      'price': "10\$"
    }));
    return plants;
  }
}