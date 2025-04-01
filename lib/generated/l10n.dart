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
    final name = (locale.countryCode?.isEmpty ?? false)
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

  /// `Personal Information`
  String get personal_information {
    return Intl.message(
      'Personal Information',
      name: 'personal_information',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get my_orders {
    return Intl.message('My Orders', name: 'my_orders', desc: '', args: []);
  }

  /// `Wishlist`
  String get wishlist {
    return Intl.message('Wishlist', name: 'wishlist', desc: '', args: []);
  }

  /// `Shipping Address`
  String get shipping_address {
    return Intl.message(
      'Shipping Address',
      name: 'shipping_address',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message('Contact Us', name: 'contact_us', desc: '', args: []);
  }

  /// `Privacy & Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy & Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Edit Information`
  String get edit_information {
    return Intl.message(
      'Edit Information',
      name: 'edit_information',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Upload Image`
  String get upload_image {
    return Intl.message(
      'Upload Image',
      name: 'upload_image',
      desc: '',
      args: [],
    );
  }

  /// `Caffeine Order`
  String get caffeine_order {
    return Intl.message(
      'Caffeine Order',
      name: 'caffeine_order',
      desc: '',
      args: [],
    );
  }

  /// `Under Processing`
  String get under_processing {
    return Intl.message(
      'Under Processing',
      name: 'under_processing',
      desc: '',
      args: [],
    );
  }

  /// `Order ID`
  String get order_id {
    return Intl.message('Order ID', name: 'order_id', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Order Time`
  String get order_time {
    return Intl.message('Order Time', name: 'order_time', desc: '', args: []);
  }

  /// `Payment Method`
  String get payment_method {
    return Intl.message(
      'Payment Method',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Cash On Delivery`
  String get cash_on_delivery {
    return Intl.message(
      'Cash On Delivery',
      name: 'cash_on_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Order Status`
  String get order_status {
    return Intl.message(
      'Order Status',
      name: 'order_status',
      desc: '',
      args: [],
    );
  }

  /// `Pick Up`
  String get pick_up {
    return Intl.message('Pick Up', name: 'pick_up', desc: '', args: []);
  }

  /// `Street`
  String get street {
    return Intl.message('Street', name: 'street', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message('Country', name: 'country', desc: '', args: []);
  }

  /// `Select Language`
  String get select_language {
    return Intl.message(
      'Select Language',
      name: 'select_language',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message('Dark Mode', name: 'dark_mode', desc: '', args: []);
  }

  /// `Delete Account`
  String get delete_account {
    return Intl.message(
      'Delete Account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Deleting Account`
  String get deleting_account {
    return Intl.message(
      'Deleting Account',
      name: 'deleting_account',
      desc: '',
      args: [],
    );
  }

  /// `Deleting your account will remove all of your information from our database. This cannot be undone.`
  String get delete_warning {
    return Intl.message(
      'Deleting your account will remove all of your information from our database. This cannot be undone.',
      name: 'delete_warning',
      desc: '',
      args: [],
    );
  }

  /// `To Confirm, type "DELETE" in the field below.`
  String get delete_confirmation {
    return Intl.message(
      'To Confirm, type "DELETE" in the field below.',
      name: 'delete_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Please type "DELETE"`
  String get delete_error {
    return Intl.message(
      'Please type "DELETE"',
      name: 'delete_error',
      desc: '',
      args: [],
    );
  }

  /// `DELETE`
  String get delete_hint {
    return Intl.message('DELETE', name: 'delete_hint', desc: '', args: []);
  }

  /// `An error occurred. Please try again.`
  String get error_occurred {
    return Intl.message(
      'An error occurred. Please try again.',
      name: 'error_occurred',
      desc: '',
      args: [],
    );
  }

  /// `Password should be at least 8 characters.`
  String get weak_password {
    return Intl.message(
      'Password should be at least 8 characters.',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get email_already_in_use {
    return Intl.message(
      'The account already exists for that email.',
      name: 'email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `Not connected to the internet. Please try again.`
  String get network_error {
    return Intl.message(
      'Not connected to the internet. Please try again.',
      name: 'network_error',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred.`
  String get unknown_error {
    return Intl.message(
      'An unknown error occurred.',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Email or password is incorrect.`
  String get email_password_incorrect {
    return Intl.message(
      'Email or password is incorrect.',
      name: 'email_password_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `User not found. Please check your email address.`
  String get user_not_found {
    return Intl.message(
      'User not found. Please check your email address.',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests. Please try again later.`
  String get too_many_requests {
    return Intl.message(
      'Too many requests. Please try again later.',
      name: 'too_many_requests',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your email.`
  String get verify_email {
    return Intl.message(
      'Please verify your email.',
      name: 'verify_email',
      desc: '',
      args: [],
    );
  }

  /// `Reset password email sent. Please check your email.`
  String get reset_password_sent {
    return Intl.message(
      'Reset password email sent. Please check your email.',
      name: 'reset_password_sent',
      desc: '',
      args: [],
    );
  }

  /// `L.E`
  String get le {
    return Intl.message('L.E', name: 'le', desc: '', args: []);
  }

  /// `S`
  String get small {
    return Intl.message('S', name: 'small', desc: '', args: []);
  }

  /// `M`
  String get medium {
    return Intl.message('M', name: 'medium', desc: '', args: []);
  }

  /// `L`
  String get large {
    return Intl.message('L', name: 'large', desc: '', args: []);
  }

  /// `No Result Found`
  String get no_result_found {
    return Intl.message(
      'No Result Found',
      name: 'no_result_found',
      desc: '',
      args: [],
    );
  }

  /// `Start Searching`
  String get start_searching {
    return Intl.message(
      'Start Searching',
      name: 'start_searching',
      desc: '',
      args: [],
    );
  }

  /// `Item added to cart successfully`
  String get item_added_success {
    return Intl.message(
      'Item added to cart successfully',
      name: 'item_added_success',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while adding item to cart`
  String get item_add_error {
    return Intl.message(
      'An error occurred while adding item to cart',
      name: 'item_add_error',
      desc: '',
      args: [],
    );
  }

  /// `Your cart is empty`
  String get cart_empty {
    return Intl.message(
      'Your cart is empty',
      name: 'cart_empty',
      desc: '',
      args: [],
    );
  }

  /// `Note added successfully`
  String get note_added_success {
    return Intl.message(
      'Note added successfully',
      name: 'note_added_success',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while adding note`
  String get note_add_error {
    return Intl.message(
      'An error occurred while adding note',
      name: 'note_add_error',
      desc: '',
      args: [],
    );
  }

  /// `Note Edited successfully`
  String get note_edited_success {
    return Intl.message(
      'Note Edited successfully',
      name: 'note_edited_success',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while Editing note`
  String get note_edit_error {
    return Intl.message(
      'An error occurred while Editing note',
      name: 'note_edit_error',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while adding address`
  String get address_add_error {
    return Intl.message(
      'An error occurred while adding address',
      name: 'address_add_error',
      desc: '',
      args: [],
    );
  }

  /// `Address added successfully`
  String get address_added_success {
    return Intl.message(
      'Address added successfully',
      name: 'address_added_success',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while Editing address`
  String get address_edit_error {
    return Intl.message(
      'An error occurred while Editing address',
      name: 'address_edit_error',
      desc: '',
      args: [],
    );
  }

  /// `Address Edited successfully`
  String get address_edited_success {
    return Intl.message(
      'Address Edited successfully',
      name: 'address_edited_success',
      desc: '',
      args: [],
    );
  }

  /// `Enter Copoun Code`
  String get enter_copoun_code {
    return Intl.message(
      'Enter Copoun Code',
      name: 'enter_copoun_code',
      desc: '',
      args: [],
    );
  }

  /// `Copoun Not Found`
  String get copoun_not_found {
    return Intl.message(
      'Copoun Not Found',
      name: 'copoun_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Copoun Value`
  String get copoun_value {
    return Intl.message(
      'Copoun Value',
      name: 'copoun_value',
      desc: '',
      args: [],
    );
  }

  /// `Copoun Used`
  String get copoun_used {
    return Intl.message('Copoun Used', name: 'copoun_used', desc: '', args: []);
  }

  /// `Copoun Expired`
  String get copoun_expired {
    return Intl.message(
      'Copoun Expired',
      name: 'copoun_expired',
      desc: '',
      args: [],
    );
  }

  /// `No Branches Found`
  String get no_branches_found {
    return Intl.message(
      'No Branches Found',
      name: 'no_branches_found',
      desc: '',
      args: [],
    );
  }

  /// `Please choose a payment method`
  String get selectMethod {
    return Intl.message(
      'Please choose a payment method',
      name: 'selectMethod',
      desc: '',
      args: [],
    );
  }

  /// `Order Placed Successfully`
  String get order_placed_success {
    return Intl.message(
      'Order Placed Successfully',
      name: 'order_placed_success',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while placing order`
  String get order_placed_error {
    return Intl.message(
      'An error occurred while placing order',
      name: 'order_placed_error',
      desc: '',
      args: [],
    );
  }

  /// `Payment Success and Order Placed Successfully`
  String get payment_success {
    return Intl.message(
      'Payment Success and Order Placed Successfully',
      name: 'payment_success',
      desc: '',
      args: [],
    );
  }

  /// `Payment Failed`
  String get payment_failed {
    return Intl.message(
      'Payment Failed',
      name: 'payment_failed',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Enter Number`
  String get enter_number {
    return Intl.message(
      'Enter Number',
      name: 'enter_number',
      desc: '',
      args: [],
    );
  }

  /// `Please add a valid number`
  String get add_valid_number {
    return Intl.message(
      'Please add a valid number',
      name: 'add_valid_number',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Phone Number`
  String get invalid_phone_number {
    return Intl.message(
      'Invalid Phone Number',
      name: 'invalid_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `No Orders Yet`
  String get no_orders_yet {
    return Intl.message(
      'No Orders Yet',
      name: 'no_orders_yet',
      desc: '',
      args: [],
    );
  }

  /// `Branch`
  String get branch {
    return Intl.message('Branch', name: 'branch', desc: '', args: []);
  }

  /// `Your wishlist is empty`
  String get whishlist_empty {
    return Intl.message(
      'Your wishlist is empty',
      name: 'whishlist_empty',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get Privacy_Policy {
    return Intl.message(
      'Privacy Policy',
      name: 'Privacy_Policy',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile Name Successfully`
  String get edit_profile_name_success {
    return Intl.message(
      'Edit Profile Name Successfully',
      name: 'edit_profile_name_success',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while editing profile name`
  String get edit_profile_name_error {
    return Intl.message(
      'An error occurred while editing profile name',
      name: 'edit_profile_name_error',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile Image Successfully`
  String get edit_profile_image_success {
    return Intl.message(
      'Edit Profile Image Successfully',
      name: 'edit_profile_image_success',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while editing profile image`
  String get edit_profile_image_error {
    return Intl.message(
      'An error occurred while editing profile image',
      name: 'edit_profile_image_error',
      desc: '',
      args: [],
    );
  }

  String get no_internet_connection {
    return Intl.message(
      'No Internet Connection',
      name: 'no_internet_connection',
      desc: '',
      args: [],
    );
  }

  String get oops {
    return Intl.message(
      'Opps!....',
      name: 'oops',
      desc: '',
      args: [],
    );
  }

  String get wrong_connection {
    return Intl.message(
      'Something wrong with your connection, Please try again after a moment.',
      name: 'wrong_connection',
      desc: '',
      args: [],
    );
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
