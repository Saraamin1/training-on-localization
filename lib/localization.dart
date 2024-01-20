import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:training_on_localization/cubit/app_cubit.dart';
import 'package:training_on_localization/cubit/app_state.dart';


class ChangeLang extends StatelessWidget {
  const ChangeLang({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
            body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${Localizations.localeOf(context)}"),
              Text(AppLocalizations.of(context)!.title),
              DropdownButton<Locale>(
                  hint: const Text('lang'),
                  value: AppCubit.get(context).currentLang,
                  items: const [
                    DropdownMenuItem<Locale>(
                      value: Locale("en"),
                      child: Text('en'),
                    ),
                    DropdownMenuItem<Locale>(
                      value: Locale("ar"),
                      child: Text('ar'),
                    ),
                  ],
                  onChanged: (v) {
                    AppCubit.get(context).changeLang(locale: v!);
                  })
            ],
          ),
        ));
      },
    );
  }
}
