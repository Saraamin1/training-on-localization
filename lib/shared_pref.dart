import 'package:shared_preferences/shared_preferences.dart';

class Shared{
  SharedPreferences? pref;
 Future saveData({required String key,required String value})async{
    pref=await SharedPreferences.getInstance();
    await pref!.setString(key, value);
  } 
 Future getData({required String key})async{
        pref=await SharedPreferences.getInstance();
return pref!.getString(key);
  }
}