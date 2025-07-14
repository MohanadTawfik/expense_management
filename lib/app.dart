import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart'; // Add google_fonts to pubspec.yaml
import 'package:personal_finance_app/core/navigation/app_router.dart'; // We will create this
import 'package:personal_finance_app/shared/presentation/theme/app_theme.dart'; // We will create this

class PersonalFinanceApp extends StatelessWidget {
  const PersonalFinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'مدير المصاريف الشخصية',
      debugShowCheckedModeBanner: false,

      // --- Localization Setup ---
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'YE'), // Arabic (Yemen)
        Locale('en', ''), // English
      ],
      locale: const Locale('ar', 'YE'), // Set Arabic as default

      // --- Theming ---
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Or connect to a provider

      // --- Navigation ---
      routerConfig: AppRouter.router, // Using GoRouter
    );
  }
}
