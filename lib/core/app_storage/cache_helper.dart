import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/product_details_screen/models/meal_info_model.dart';

class CacheHelper {
  final SharedPreferences? _sharedPreferences;
  static CacheHelper? _instance;

  CacheHelper._(this._sharedPreferences);

  static Future<CacheHelper> getInstance() async {
    _instance ??= CacheHelper._(await SharedPreferences.getInstance());
    return _instance!;
  }

  clearCache({required String key, context}) {
    _sharedPreferences!.remove(key);
  }

  void setCartData({
    required String mealsAddedToCart,
  }) {
    _sharedPreferences?.setString('Cart', json.encode(mealsAddedToCart));
  }

  List<MealInfoModel>? getCartData() {
    var dataStr = _sharedPreferences?.getString('Cart');
    if (dataStr == null) return null;
    return json.decode(dataStr);
  }

  clearAllData() {
    _sharedPreferences?.clear();
  }
}
