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

  /// `Search Result`
  String get search_result {
    return Intl.message(
      'Search Result',
      name: 'search_result',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Size`
  String get size {
    return Intl.message('Size', name: 'size', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Buy Now`
  String get buy_now {
    return Intl.message('Buy Now', name: 'buy_now', desc: '', args: []);
  }

  /// `Detail`
  String get detail {
    return Intl.message('Detail', name: 'detail', desc: '', args: []);
  }

  /// `Read More`
  String get read_more {
    return Intl.message('Read More', name: 'read_more', desc: '', args: []);
  }

  /// `Read Less`
  String get read_less {
    return Intl.message('Read Less', name: 'read_less', desc: '', args: []);
  }

  /// `Rate this item`
  String get rate_this_item {
    return Intl.message(
      'Rate this item',
      name: 'rate_this_item',
      desc: '',
      args: [],
    );
  }

  /// `Tap on the stars to give a rating`
  String get tap_on_stars {
    return Intl.message(
      'Tap on the stars to give a rating',
      name: 'tap_on_stars',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `You Rated`
  String get YouRated {
    return Intl.message('You Rated', name: 'YouRated', desc: '', args: []);
  }

  /// ` Successfully`
  String get Successfully {
    return Intl.message(
      ' Successfully',
      name: 'Successfully',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Proceed to Checkout`
  String get proceed_to_checkout {
    return Intl.message(
      'Proceed to Checkout',
      name: 'proceed_to_checkout',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get Total {
    return Intl.message('Total', name: 'Total', desc: '', args: []);
  }

  /// `items`
  String get items {
    return Intl.message('items', name: 'items', desc: '', args: []);
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Delivery Address`
  String get delivery_address {
    return Intl.message(
      'Delivery Address',
      name: 'delivery_address',
      desc: '',
      args: [],
    );
  }

  /// `Add Address`
  String get add_address {
    return Intl.message('Add Address', name: 'add_address', desc: '', args: []);
  }

  /// `Edit Address`
  String get edit_address {
    return Intl.message(
      'Edit Address',
      name: 'edit_address',
      desc: '',
      args: [],
    );
  }

  /// `Add Note`
  String get add_note {
    return Intl.message('Add Note', name: 'add_note', desc: '', args: []);
  }

  /// `Edit Note`
  String get edit_note {
    return Intl.message('Edit Note', name: 'edit_note', desc: '', args: []);
  }

  /// `Your Orders`
  String get your_orders {
    return Intl.message('Your Orders', name: 'your_orders', desc: '', args: []);
  }

  /// `Coupon Applied Successfully`
  String get coupon_applied_success {
    return Intl.message(
      'Coupon Applied Successfully',
      name: 'coupon_applied_success',
      desc: '',
      args: [],
    );
  }

  /// `Payment Summary`
  String get payment_summary {
    return Intl.message(
      'Payment Summary',
      name: 'payment_summary',
      desc: '',
      args: [],
    );
  }

  /// `Proceed to Payment`
  String get proceed_to_payment {
    return Intl.message(
      'Proceed to Payment',
      name: 'proceed_to_payment',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Fee`
  String get delivery_fee {
    return Intl.message(
      'Delivery Fee',
      name: 'delivery_fee',
      desc: '',
      args: [],
    );
  }

  /// `Pickup From Cafe`
  String get pickup_from_cafe {
    return Intl.message(
      'Pickup From Cafe',
      name: 'pickup_from_cafe',
      desc: '',
      args: [],
    );
  }

  /// `Select Pickup Cafe`
  String get select_pickup_cafe {
    return Intl.message(
      'Select Pickup Cafe',
      name: 'select_pickup_cafe',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message('Quantity', name: 'quantity', desc: '', args: []);
  }

  /// `Deliver`
  String get deliver {
    return Intl.message('Deliver', name: 'deliver', desc: '', args: []);
  }

  /// `Pickup`
  String get pickup {
    return Intl.message('Pickup', name: 'pickup', desc: '', args: []);
  }

  /// `Add a note to your order`
  String get add_note_to_order {
    return Intl.message(
      'Add a note to your order',
      name: 'add_note_to_order',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Edit a note`
  String get edit_note_text {
    return Intl.message(
      'Edit a note',
      name: 'edit_note_text',
      desc: '',
      args: [],
    );
  }

  /// `Update Note`
  String get update_note {
    return Intl.message('Update Note', name: 'update_note', desc: '', args: []);
  }

  /// `Payment`
  String get payment {
    return Intl.message('Payment', name: 'payment', desc: '', args: []);
  }

  /// `Choose Your Payment Method`
  String get choose_payment_method {
    return Intl.message(
      'Choose Your Payment Method',
      name: 'choose_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Place Order`
  String get place_order {
    return Intl.message('Place Order', name: 'place_order', desc: '', args: []);
  }

  /// `Card`
  String get card {
    return Intl.message('Card', name: 'card', desc: '', args: []);
  }

  /// `Online Wallets`
  String get online_wallets {
    return Intl.message(
      'Online Wallets',
      name: 'online_wallets',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message('Cash', name: 'cash', desc: '', args: []);
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
