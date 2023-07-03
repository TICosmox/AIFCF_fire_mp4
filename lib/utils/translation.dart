// ignore_for_file: prefer_initializing_formals

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Translations {
  Translations(Locale locale) {
    this.locale = locale;
    _localizedValues = null;
  }

  Locale? locale;
  static Map<dynamic, dynamic>? _localizedValues;

  static Translations? of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  String text(String key) {
    return _localizedValues![key] ?? '** $key not found';
  }

  static Future<Translations> load(Locale locale) async {
    Translations translations = Translations(locale);
    String jsonContent =
        await rootBundle.loadString("assets/i18n/${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return translations;
  }

  get currentLanguage => locale!.languageCode;
}

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}
