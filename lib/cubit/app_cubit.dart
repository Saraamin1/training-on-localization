import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_on_localization/cubit/app_state.dart';
import 'package:training_on_localization/shared_pref.dart';



class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context)=>BlocProvider.of(context);
  dynamic currentLang=const Locale('en');
  
  void changeLang({required Locale locale})async{
currentLang=locale;
await Shared().saveData(key:'lang' ,value:locale.languageCode );
emit(ChangeLangState());
  }
  getLang()async{
   currentLang=Locale(await Shared().getData(key: 'lang')?? 'en');

   emit(GetLangState());
  }
}
