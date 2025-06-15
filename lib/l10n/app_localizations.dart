import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Daily Visdom'**
  String get appName;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @generalError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get generalError;

  /// No description provided for @languageCodeEN.
  ///
  /// In en, this message translates to:
  /// **'en'**
  String get languageCodeEN;

  /// No description provided for @languageCodeTR.
  ///
  /// In en, this message translates to:
  /// **'tr'**
  String get languageCodeTR;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageTurkish.
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get languageTurkish;

  /// No description provided for @languageSelectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Language Selection'**
  String get languageSelectionTitle;

  /// No description provided for @languageSelectionEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageSelectionEnglish;

  /// No description provided for @languageSelectionEnglishKey.
  ///
  /// In en, this message translates to:
  /// **'en'**
  String get languageSelectionEnglishKey;

  /// No description provided for @languageSelectionTurkish.
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get languageSelectionTurkish;

  /// No description provided for @languageSelectionTurkishKey.
  ///
  /// In en, this message translates to:
  /// **'tr'**
  String get languageSelectionTurkishKey;

  /// No description provided for @navigationFeed.
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get navigationFeed;

  /// No description provided for @navigationDiscover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get navigationDiscover;

  /// No description provided for @navigationLiked.
  ///
  /// In en, this message translates to:
  /// **'Liked'**
  String get navigationLiked;

  /// No description provided for @navigationAlerts.
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get navigationAlerts;

  /// No description provided for @navigationProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navigationProfile;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signInWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back 👋'**
  String get signInWelcome;

  /// No description provided for @signInSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue exploring quotes.'**
  String get signInSubtitle;

  /// No description provided for @signInEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get signInEmail;

  /// No description provided for @signInEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get signInEmailHint;

  /// No description provided for @signInPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signInPassword;

  /// No description provided for @signInPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Minimum 6 characters'**
  String get signInPasswordHint;

  /// No description provided for @signInForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get signInForgotPassword;

  /// No description provided for @signInDontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get signInDontHaveAccount;

  /// No description provided for @signInFailed.
  ///
  /// In en, this message translates to:
  /// **'Sign in failed.'**
  String get signInFailed;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @signUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get signUpTitle;

  /// No description provided for @signUpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join us and get inspired every day.'**
  String get signUpSubtitle;

  /// No description provided for @signUpEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get signUpEmail;

  /// No description provided for @signUpEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email.'**
  String get signUpEmailHint;

  /// No description provided for @signUpUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get signUpUsername;

  /// No description provided for @signUpUsernameHint.
  ///
  /// In en, this message translates to:
  /// **'Username must be between 3 and 32 characters.'**
  String get signUpUsernameHint;

  /// No description provided for @signUpPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signUpPassword;

  /// No description provided for @signUpPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters.'**
  String get signUpPasswordHint;

  /// No description provided for @signUpConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get signUpConfirmPassword;

  /// No description provided for @signUpConfirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match.'**
  String get signUpConfirmPasswordHint;

  /// No description provided for @signUpPasswordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get signUpPasswordsDoNotMatch;

  /// No description provided for @signUpAlreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get signUpAlreadyHaveAccount;

  /// No description provided for @signUpSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Account Created Successfully!'**
  String get signUpSuccessTitle;

  /// No description provided for @signUpSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your account has been created. You can now sign in to start exploring quotes.'**
  String get signUpSuccessMessage;

  /// No description provided for @signUpSuccessContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue to Sign In'**
  String get signUpSuccessContinue;

  /// No description provided for @signUpFailed.
  ///
  /// In en, this message translates to:
  /// **'Sign up failed.'**
  String get signUpFailed;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @forgotPasswordWithQuestionMark.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPasswordWithQuestionMark;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Your Password'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address and we\'ll send you a link to reset your password.'**
  String get forgotPasswordDescription;

  /// No description provided for @forgotPasswordEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get forgotPasswordEmail;

  /// No description provided for @forgotPasswordEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get forgotPasswordEmailHint;

  /// No description provided for @forgotPasswordSubmit.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get forgotPasswordSubmit;

  /// No description provided for @forgotPasswordFailed.
  ///
  /// In en, this message translates to:
  /// **'Password Reset Failed'**
  String get forgotPasswordFailed;

  /// No description provided for @forgotPasswordResetLinkSent.
  ///
  /// In en, this message translates to:
  /// **'If your email exists in our system, a password reset link has been sent.'**
  String get forgotPasswordResetLinkSent;

  /// No description provided for @forgotPasswordRemembered.
  ///
  /// In en, this message translates to:
  /// **'Remembered your password?'**
  String get forgotPasswordRemembered;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
