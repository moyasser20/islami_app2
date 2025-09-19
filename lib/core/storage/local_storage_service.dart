
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageService {
  static late SharedPreferences _sharedPreferences;

  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setString(String key, String value)async {
    return await _sharedPreferences.setString(key, value);
  }

  static Future<bool> setList(String key, List<String> values)async {
    return await _sharedPreferences.setStringList(key, values);
  }


  static Future<bool> setInt(String key, String value) async{
    return await _sharedPreferences.setString(key, value);
  }

  static Future<bool> setBool(String key, String value) async{
    return await _sharedPreferences.setString(key, value);
  }

  static  bool? getbool(String key){
    return _sharedPreferences.getBool(key);
  }

  static int? getInt(String key){
    return _sharedPreferences.getInt(key);
  }

  static  String? getString(String key){
    return _sharedPreferences.getString(key);
  }

  static List<String>? getList(String key){
    return _sharedPreferences.getStringList(key);
  }
}