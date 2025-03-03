// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Fall in Love with Coffee in Blissful Delight!`
  String get fall_in_love_with_coffee {
    return Intl.message(
      'Fall in Love with Coffee in Blissful Delight!',
      name: 'fall_in_love_with_coffee',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our cozy coffee corner, where every cup is a delightful for you.`
  String get welcome_message {
    return Intl.message(
      'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
      name: 'welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get get_started {
    return Intl.message('Get Started', name: 'get_started', desc: '', args: []);
  }

  /// `Login here`
  String get login_here {
    return Intl.message('Login here', name: 'login_here', desc: '', args: []);
  }

  /// `Welcome back you've been missed`
  String get welcome_back {
    return Intl.message(
      'Welcome back you\'ve been missed',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message('Sign In', name: 'sign_in', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Create new account`
  String get create_new_account {
    return Intl.message(
      'Create new account',
      name: 'create_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Or continue with`
  String get or_continue_with {
    return Intl.message(
      'Or continue with',
      name: 'or_continue_with',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our coffee corner, where every cup is a delightful for you.`
  String get welcome_message_register {
    return Intl.message(
      'Welcome to our coffee corner, where every cup is a delightful for you.',
      name: 'welcome_message_register',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message('Full Name', name: 'full_name', desc: '', args: []);
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message('Sign Up', name: 'sign_up', desc: '', args: []);
  }

  /// `Already have an account?`
  String get already_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Your Password`
  String get forgot_your_password {
    return Intl.message(
      'Forgot Your Password',
      name: 'forgot_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry, just write your email and we will send you a link to reset your password.`
  String get forgot_password_message {
    return Intl.message(
      'Don\'t worry, just write your email and we will send you a link to reset your password.',
      name: 'forgot_password_message',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `is required`
  String get is_required {
    return Intl.message('is required', name: 'is_required', desc: '', args: []);
  }

  /// `Password must be at least 8 characters`
  String get password_min_length {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'password_min_length',
      desc: '',
      args: [],
    );
  }

  /// `Search Coffee`
  String get search_coffee {
    return Intl.message(
      'Search Coffee',
      name: 'search_coffee',
      desc: '',
      args: [],
    );
  }

  /// `Search Cafe`
  String get search_cafe {
    return Intl.message('Search Cafe', name: 'search_cafe', desc: '', args: []);
  }

  /// `Enter Your Coupon Code Here`
  String get enter_coupon_code {
    return Intl.message(
      'Enter Your Coupon Code Here',
      name: 'enter_coupon_code',
      desc: '',
      args: [],
    );
  }

  /// `Hello 👋 ,`
  String get hello {
    return Intl.message('Hello 👋 ,', name: 'hello', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
