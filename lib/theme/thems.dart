import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white, // خلفية الشريط السفلي
      selectedItemColor: Color(0xFF1877F2), // لون الأيقونة عند التحديد
      unselectedItemColor: Colors.grey[700], // لون الأيقونات الأخرى
    ),
    primaryColor: Color(0xFF2C3E50),
    dividerColor: Color(0xFFE0E0E0),
    hintColor: Color(0xFF757575),
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Color(0xFF007BFF), // أزرق تقني
      onPrimary: Colors.grey.shade800,
      background: Color(0xFFF5F5F5), // رمادي فاتح جدًا
      onBackground: Colors.black,
      secondary: Color(0xFF757575), // أزرق غامق
      onSecondary: Colors.white,
      surface: Colors.white,
      primaryContainer: Color(0xFFE0E3EB),
      secondaryContainer: Color(0xFF1877F2),
      shadow: Color(0xFFE0E0E0),
      onSurface: Colors.black,
    ),
    hoverColor: Colors.white,
    scaffoldBackgroundColor: Color(0xFFF5F5F5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white, // خلفية الشريط العلوي
      elevation: 0, // إزالة الظل
      titleTextStyle: TextStyle(
        color: Color(0xFF212121), // لون النص (رمادي داكن)
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Color(0xFF212121), // لون الأيقونات
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFF1877F2), // لون الأيقونة النشطة (أزرق فيسبوك)
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0056B3),
        foregroundColor: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Color(0xFFFFFFFF),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xFFE0E0E0)),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E), // خلفية الشريط السفلي
      selectedItemColor: Color(0xFF2196F3), // لون الأيقونة عند التحديد
      unselectedItemColor: Colors.grey[400], // لون الأيقونات الأخرى
    ),

    primaryColor: Color(0xFF1E1E2C),
    dividerColor: Color(0xFF33373D),
    hintColor: Color(0xFFBDBDBD),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF6200EA), // بنفسجي تقني
      onPrimary: Colors.grey.shade300,
      background: Color(0xFF121212), // رمادي داكن جدًا
      onBackground: Colors.white,
      secondary: Color(0xFFBDBDBD), // بنفسجي غامق
      onSecondary: Colors.white,
      shadow: Color(0xFF333333),
      primaryContainer: Color(0xFF3A3F4B),
      secondaryContainer: Color(0xFF1877F2),
      surface: Color(0xFF1E1E1E), // سطح داكن
      onSurface: Colors.white,
    ),
    hoverColor: Color(0xFF1A1A1A),
    scaffoldBackgroundColor: Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E), // خلفية الشريط العلوي
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Color(0xFFF5F5F5), // لون النص (رمادي فاتح)
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Color(0xFFF5F5F5), // لون الأيقونات
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFF2196F3), // لون الأيقونة النشطة (أزرق فاتح)
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF3700B3),
        foregroundColor: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Color(0xFF1E1E1E),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xFF333333)),
      ),
    ),
  );
}
