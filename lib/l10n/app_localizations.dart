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

  /// No description provided for @generalTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Please try again'**
  String get generalTryAgain;

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

  /// No description provided for @languageSelectionEnglishFlagEmojiKey.
  ///
  /// In en, this message translates to:
  /// **'🇺🇸'**
  String get languageSelectionEnglishFlagEmojiKey;

  /// No description provided for @languageSelectionTurkishFlagEmojiKey.
  ///
  /// In en, this message translates to:
  /// **'🇹🇷'**
  String get languageSelectionTurkishFlagEmojiKey;

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

  /// No description provided for @dashboardFeed.
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get dashboardFeed;

  /// No description provided for @dashboardDiscover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get dashboardDiscover;

  /// No description provided for @dashboardLiked.
  ///
  /// In en, this message translates to:
  /// **'Liked'**
  String get dashboardLiked;

  /// No description provided for @dashboardNotification.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get dashboardNotification;

  /// No description provided for @dashboardProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get dashboardProfile;

  /// No description provided for @profileEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profileEdit;

  /// No description provided for @profileChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get profileChangePassword;

  /// No description provided for @profileSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profileSettings;

  /// No description provided for @profileAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get profileAbout;

  /// No description provided for @profileLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get profileLanguage;

  /// No description provided for @profileDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get profileDeleteAccount;

  /// No description provided for @profileSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get profileSignOut;

  /// No description provided for @profileLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load profile'**
  String get profileLoadFailed;

  /// No description provided for @profileSignOutDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get profileSignOutDialogTitle;

  /// No description provided for @profileSignOutDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out?'**
  String get profileSignOutDialogContent;

  /// No description provided for @profileSignOutDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get profileSignOutDialogCancel;

  /// No description provided for @profileSignOutDialogConfirm.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get profileSignOutDialogConfirm;

  /// No description provided for @profileDeleteAccountDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get profileDeleteAccountDialogTitle;

  /// No description provided for @profileDeleteAccountDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account? This action cannot be undone.'**
  String get profileDeleteAccountDialogContent;

  /// No description provided for @profileDeleteAccountDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get profileDeleteAccountDialogCancel;

  /// No description provided for @profileDeleteAccountDialogProceed.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get profileDeleteAccountDialogProceed;

  /// No description provided for @profileDeleteAccountConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Final Confirmation'**
  String get profileDeleteAccountConfirmationTitle;

  /// No description provided for @profileDeleteAccountConfirmationContent.
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete your account and all your data. This action cannot be undone.'**
  String get profileDeleteAccountConfirmationContent;

  /// No description provided for @profileDeleteAccountConfirmationPhrase.
  ///
  /// In en, this message translates to:
  /// **'DELETE'**
  String get profileDeleteAccountConfirmationPhrase;

  /// No description provided for @profileDeleteAccountConfirmationInstruction.
  ///
  /// In en, this message translates to:
  /// **'To confirm, type {confirmationPhrase}'**
  String profileDeleteAccountConfirmationInstruction(Object confirmationPhrase);

  /// No description provided for @profileDeleteAccountConfirmationError.
  ///
  /// In en, this message translates to:
  /// **'The confirmation text doesn\'t match'**
  String get profileDeleteAccountConfirmationError;

  /// No description provided for @profileDeleteAccountConfirmationSubmit.
  ///
  /// In en, this message translates to:
  /// **'Delete My Account'**
  String get profileDeleteAccountConfirmationSubmit;

  /// No description provided for @profileDeleteAccountFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete account'**
  String get profileDeleteAccountFailed;

  /// No description provided for @profileUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get profileUsername;

  /// No description provided for @profileUsernameRequired.
  ///
  /// In en, this message translates to:
  /// **'Username is required'**
  String get profileUsernameRequired;

  /// No description provided for @profileUsernameTooShort.
  ///
  /// In en, this message translates to:
  /// **'Username must be at least 3 characters'**
  String get profileUsernameTooShort;

  /// No description provided for @profileSave.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get profileSave;

  /// No description provided for @profileUpdateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profileUpdateSuccess;

  /// No description provided for @profileUpdateError.
  ///
  /// In en, this message translates to:
  /// **'Failed to update profile'**
  String get profileUpdateError;

  /// No description provided for @profileEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profileEmail;

  /// No description provided for @passwordChangeTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get passwordChangeTitle;

  /// No description provided for @passwordChangeCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get passwordChangeCurrent;

  /// No description provided for @passwordChangeNew.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get passwordChangeNew;

  /// No description provided for @passwordChangeConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get passwordChangeConfirm;

  /// No description provided for @passwordChangeCurrentRequired.
  ///
  /// In en, this message translates to:
  /// **'Current password is required'**
  String get passwordChangeCurrentRequired;

  /// No description provided for @passwordChangeNewRequired.
  ///
  /// In en, this message translates to:
  /// **'New password is required'**
  String get passwordChangeNewRequired;

  /// No description provided for @passwordChangeNewTooShort.
  ///
  /// In en, this message translates to:
  /// **'New password must be at least 8 characters'**
  String get passwordChangeNewTooShort;

  /// No description provided for @passwordChangeConfirmRequired.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your new password'**
  String get passwordChangeConfirmRequired;

  /// No description provided for @passwordChangeConfirmMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'t match'**
  String get passwordChangeConfirmMismatch;

  /// No description provided for @passwordChangeSubmit.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get passwordChangeSubmit;

  /// No description provided for @passwordChangeSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get passwordChangeSuccess;

  /// No description provided for @passwordChangeError.
  ///
  /// In en, this message translates to:
  /// **'Failed to change password'**
  String get passwordChangeError;

  /// No description provided for @passwordChangeRequirements.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long.'**
  String get passwordChangeRequirements;
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
