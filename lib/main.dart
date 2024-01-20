import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:training_on_localization/cubit/app_cubit.dart';
import 'package:training_on_localization/cubit/app_state.dart';
import 'package:training_on_localization/localization.dart';

void main() {
  runApp( BlocProvider(
    create: (context) => AppCubit()..getLang(),
    child:const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return MaterialApp(
          locale:
           AppCubit.get(context).currentLang,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ChangeLang(),
        );
      },
    );
  }
}
