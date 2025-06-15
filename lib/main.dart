import 'package:daily_quote_app/authentication/screen/start_forgot_password_screen.dart';
import 'package:daily_quote_app/authentication/screen/sign_up_screen.dart';
import 'package:daily_quote_app/common/extension/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'authentication/screen/sign_in_screen.dart';
import 'authentication/screen/sign_up_success_screen.dart';
import 'common/constants/routes.dart';
import 'common/utility/language_utility.dart';
import 'feed/screen/feed_screen.dart';
import 'discover/screen/discover_screen.dart';
import 'l10n/app_localizations.dart';
import 'liked/screen/liked_screen.dart';
import 'notification/screen/notification_screen.dart';
import 'profile/screen/profile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(const DailyQuoteApp());
}

class DailyQuoteApp extends StatefulWidget {
  const DailyQuoteApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    final _DailyQuoteAppState? state = context.findAncestorStateOfType<_DailyQuoteAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<DailyQuoteApp> createState() => _DailyQuoteAppState();
}

class _DailyQuoteAppState extends State<DailyQuoteApp> {
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final lang = await LanguageHelper.getLanguage();
    setState(() {
      _locale = Locale(lang);
    });
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailyQuoteApp',
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.teal,
          hintColor: Colors.white70,
          scaffoldBackgroundColor: const Color(0xFF121212),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF1F1F1F), foregroundColor: Colors.teal, elevation: 1),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xFF1F1F1F),
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.grey,
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color(0xFF1E1E1E),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            labelStyle: const TextStyle(color: Colors.teal),
            prefixIconColor: Colors.teal,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: Colors.teal)),
          textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white70)),
        ),
        themeMode: ThemeMode.dark,
      home: const SignInScreen(),
      routes: {
        Routes.signIn: (context) => const SignInScreen(),
        Routes.signUp: (context) => const SignUpScreen(),
        Routes.forgotPassword : (context) => const StartForgotPasswordScreen(),
        Routes.signUpSuccess: (context) => const SignUpSuccessScreen(),
        Routes.feed : (context) => const FeedScreen(),
      }
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    FeedScreen(),
    DiscoverScreen(),
    LikedScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.view_agenda),
            label: context.message.navigationFeed,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.explore),
            label: context.message.navigationDiscover,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: context.message.navigationLiked,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: context.message.navigationAlerts,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: context.message.navigationProfile,
          ),
        ],
      ),
    );
  }
}
