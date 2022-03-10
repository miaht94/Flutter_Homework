import 'package:scoped_model/scoped_model.dart';

class Category extends Model {

  Category(this._title, this._imagePath, this._isActivating);
  String _title;
  String _imagePath;
  bool _isActivating;
  String get title {
    return _title;
  }

  String get imagePath {
    return _imagePath;
  }
  
  bool get isActivating {
    return _isActivating;
  }

  void set title(String title) {
    _title = title;
    notifyListeners();
  }
  
  void set imagePath(String imagePath) {
    _imagePath = imagePath;
    notifyListeners();
  }

  void set isActivating(bool isActivating) {
    _isActivating = isActivating;
    notifyListeners();
  }

  static List<Category> getSampleCategories() {
    List<Category> ret = [Category("Pizza", "assets/icons/pizza.png", true),
                          Category("Seafood", "assets/icons/shrimp.png", false),
                          Category("Soft Drink", "assets/icons/soda.png", false),
                          Category("Hamburger", "assets/icons/burger.png", false)];
    return ret;
  }
}