import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class SharedPref with ChangeNotifier{

  static const language_status ='language_status';


  static String cache_selected_language = "ENG";

  static Future<bool> setData(String key,String value) async{
    if(key == language_status){
      cache_selected_language = value;
    }

    SharedPreferences shp = await SharedPreferences.getInstance();
    return shp.setString(key, value);
  }

  static Future<String> getData({@required String key})  async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    String result = shp.getString(key);

    if(key == language_status){
      cache_selected_language = result;
    }

    return result;
  }

  static bool IsSelectedEng() {
    return (cache_selected_language == "ENG");
  }

  static void clear() async{
    SharedPreferences shp = await SharedPreferences.getInstance();
    shp.clear();
  }

}