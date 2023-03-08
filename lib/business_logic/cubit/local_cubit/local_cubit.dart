import 'package:app1/l10n/language_cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit() : super(LocalInitial());

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();

    emit(ChangeLocalState(Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String localanguageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(localanguageCode);
    emit(ChangeLocalState(Locale(localanguageCode)));
  }
}
