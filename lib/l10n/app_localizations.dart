import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Sozia',
      'welcome': 'Welcome to Sozia!',
      'start': 'Start',
      'home': 'Home',
      'profile': 'Profile',
      'add_post': 'Add Post',
    },
    'ar': {
      'title': 'سوزيا',
      'welcome': 'مرحبًا بك في سوزيا!',
      'start': 'ابدأ',
      'home': 'الرئيسية',
      'profile': 'الملف الشخصي',
      'add_post': 'أضف منشور',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
