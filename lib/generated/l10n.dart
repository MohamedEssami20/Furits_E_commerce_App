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

  /// `Welcome to`
  String get helloInApp {
    return Intl.message('Welcome to', name: 'helloInApp', desc: '', args: []);
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and enjoy the best deals with top quality.`
  String get onboardingText1 {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and enjoy the best deals with top quality.',
      name: 'onboardingText1',
      desc: '',
      args: [],
    );
  }

  /// `Search and Shop`
  String get searchAndShop {
    return Intl.message(
      'Search and Shop',
      name: 'searchAndShop',
      desc: '',
      args: [],
    );
  }

  /// `We bring you the finest carefully selected fruits. Check out details, photos, and reviews to make sure you choose the perfect fruit.`
  String get onboardingText2 {
    return Intl.message(
      'We bring you the finest carefully selected fruits. Check out details, photos, and reviews to make sure you choose the perfect fruit.',
      name: 'onboardingText2',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get startNow {
    return Intl.message('Start Now', name: 'startNow', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Email`
  String get emailHint {
    return Intl.message('Email', name: 'emailHint', desc: '', args: []);
  }

  /// `Password`
  String get passwordHint {
    return Intl.message('Password', name: 'passwordHint', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Sign In With Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign In With Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign In With Facebook`
  String get signInWithFacebook {
    return Intl.message(
      'Sign In With Facebook',
      name: 'signInWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Sign In With Apple`
  String get signInWithApple {
    return Intl.message(
      'Sign In With Apple',
      name: 'signInWithApple',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get newAccount {
    return Intl.message('New Account', name: 'newAccount', desc: '', args: []);
  }

  /// `Full Name`
  String get fullNameHint {
    return Intl.message('Full Name', name: 'fullNameHint', desc: '', args: []);
  }

  /// `By creating an account, you agree to`
  String get byCreatingAccount {
    return Intl.message(
      'By creating an account, you agree to',
      name: 'byCreatingAccount',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Special`
  String get specialText {
    return Intl.message('Special', name: 'specialText', desc: '', args: []);
  }

  /// `Our`
  String get our {
    return Intl.message('Our', name: 'our', desc: '', args: []);
  }

  /// `Create New Account`
  String get createNewAccount {
    return Intl.message(
      'Create New Account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgotPasswordText {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `Don’t worry, just enter your email and we’ll send you a link to reset your password.`
  String get resetPasswordTitle {
    return Intl.message(
      'Don’t worry, just enter your email and we’ll send you a link to reset your password.',
      name: 'resetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgetPasswordButton {
    return Intl.message(
      'Forget Password',
      name: 'forgetPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get verificationCode {
    return Intl.message(
      'Verification Code',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code we sent to the following email address`
  String get enterVerificationCode {
    return Intl.message(
      'Enter the code we sent to the following email address',
      name: 'enterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verifyCode {
    return Intl.message('Verify Code', name: 'verifyCode', desc: '', args: []);
  }

  /// `Resend verification code`
  String get resendverificationCode {
    return Intl.message(
      'Resend verification code',
      name: 'resendverificationCode',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPasswordHint {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password`
  String get enterNewPasswordHint {
    return Intl.message(
      'Enter new password',
      name: 'enterNewPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Create New Password`
  String get createNewPassword {
    return Intl.message(
      'Create New Password',
      name: 'createNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Password Done`
  String get changePasswordDone {
    return Intl.message(
      'Change Password Done',
      name: 'changePasswordDone',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning!`
  String get goodMorning {
    return Intl.message(
      'Good Morning!',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Search about fruits`
  String get searchAboutFruits {
    return Intl.message(
      'Search about fruits',
      name: 'searchAboutFruits',
      desc: '',
      args: [],
    );
  }

  /// `Best Selling`
  String get bestSellingFruits {
    return Intl.message(
      'Best Selling',
      name: 'bestSellingFruits',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Product`
  String get product {
    return Intl.message('Product', name: 'product', desc: '', args: []);
  }

  /// `Products`
  String get productsTwo {
    return Intl.message('Products', name: 'productsTwo', desc: '', args: []);
  }

  /// `No Product into Cart`
  String get noProductIntoCart {
    return Intl.message(
      'No Product into Cart',
      name: 'noProductIntoCart',
      desc: '',
      args: [],
    );
  }

  /// `No Result Found`
  String get noRsultFound {
    return Intl.message(
      'No Result Found',
      name: 'noRsultFound',
      desc: '',
      args: [],
    );
  }

  /// `Products into Cart`
  String get productsIntoCart {
    return Intl.message(
      'Products into Cart',
      name: 'productsIntoCart',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Oops... this information is not available at the moment.`
  String get oppsNotAvailable {
    return Intl.message(
      'Oops... this information is not available at the moment.',
      name: 'oppsNotAvailable',
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

  /// `New`
  String get newText {
    return Intl.message('New', name: 'newText', desc: '', args: []);
  }

  /// `Select All As Read`
  String get selectAllAsRead {
    return Intl.message(
      'Select All As Read',
      name: 'selectAllAsRead',
      desc: '',
      args: [],
    );
  }

  /// `Sort By`
  String get sortBy {
    return Intl.message('Sort By', name: 'sortBy', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `To`
  String get to {
    return Intl.message('To', name: 'to', desc: '', args: []);
  }

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `Price (Low to High)`
  String get priceLowToHigh {
    return Intl.message(
      'Price (Low to High)',
      name: 'priceLowToHigh',
      desc: '',
      args: [],
    );
  }

  /// `Price (High to Low)`
  String get priceHighToLow {
    return Intl.message(
      'Price (High to Low)',
      name: 'priceHighToLow',
      desc: '',
      args: [],
    );
  }

  /// `Alphabetical`
  String get alphabetical {
    return Intl.message(
      'Alphabetical',
      name: 'alphabetical',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'egp/kg' key

  /// `EGP`
  String get egp {
    return Intl.message('EGP', name: 'egp', desc: '', args: []);
  }

  /// `Kg`
  String get kg {
    return Intl.message('Kg', name: 'kg', desc: '', args: []);
  }

  /// `Reviews`
  String get reviews {
    return Intl.message('Reviews', name: 'reviews', desc: '', args: []);
  }

  /// `Expiry`
  String get expiry {
    return Intl.message('Expiry', name: 'expiry', desc: '', args: []);
  }

  /// `Organic`
  String get organic {
    return Intl.message('Organic', name: 'organic', desc: '', args: []);
  }

  /// `Grams`
  String get grams {
    return Intl.message('Grams', name: 'grams', desc: '', args: []);
  }

  /// `Add To Cart`
  String get addToCart {
    return Intl.message('Add To Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `You have`
  String get youHave {
    return Intl.message('You have', name: 'youHave', desc: '', args: []);
  }

  /// `In Cart`
  String get inCart {
    return Intl.message('In Cart', name: 'inCart', desc: '', args: []);
  }

  /// `Pay`
  String get pay {
    return Intl.message('Pay', name: 'pay', desc: '', args: []);
  }

  /// `Write Comment`
  String get writeComment {
    return Intl.message(
      'Write Comment',
      name: 'writeComment',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get summary {
    return Intl.message('Summary', name: 'summary', desc: '', args: []);
  }

  /// `Shipping`
  String get shipping {
    return Intl.message('Shipping', name: 'shipping', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Payment`
  String get payment {
    return Intl.message('Payment', name: 'payment', desc: '', args: []);
  }

  /// `Review`
  String get review {
    return Intl.message('Review', name: 'review', desc: '', args: []);
  }

  /// `Cash on Delivery`
  String get payWhenYouGetIt {
    return Intl.message(
      'Cash on Delivery',
      name: 'payWhenYouGetIt',
      desc: '',
      args: [],
    );
  }

  /// `Pickup From Store`
  String get pickupFromStore {
    return Intl.message(
      'Pickup From Store',
      name: 'pickupFromStore',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now, Pay Later`
  String get buyNowPayLater {
    return Intl.message(
      'Buy Now, Pay Later',
      name: 'buyNowPayLater',
      desc: '',
      args: [],
    );
  }

  /// `Please select a payment method`
  String get selectPaymentMethod {
    return Intl.message(
      'Please select a payment method',
      name: 'selectPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Floor Number`
  String get floorNumber {
    return Intl.message(
      'Floor Number',
      name: 'floorNumber',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary:`
  String get orderSummary {
    return Intl.message(
      'Order Summary:',
      name: 'orderSummary',
      desc: '',
      args: [],
    );
  }

  /// `No orders yet`
  String get noOrders {
    return Intl.message('No orders yet', name: 'noOrders', desc: '', args: []);
  }

  /// `Subtotal`
  String get subTotal {
    return Intl.message('Subtotal', name: 'subTotal', desc: '', args: []);
  }

  /// `Delivery`
  String get delivery {
    return Intl.message('Delivery', name: 'delivery', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Shipping Address`
  String get shippingAddress {
    return Intl.message(
      'Shipping Address',
      name: 'shippingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Order`
  String get confirmOrder {
    return Intl.message(
      'Confirm Order',
      name: 'confirmOrder',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Order Number`
  String get orderNumber {
    return Intl.message(
      'Order Number',
      name: 'orderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Track Order`
  String get trackOrder {
    return Intl.message('Track Order', name: 'trackOrder', desc: '', args: []);
  }

  /// `Order Placed`
  String get orderPlaced {
    return Intl.message(
      'Order Placed',
      name: 'orderPlaced',
      desc: '',
      args: [],
    );
  }

  /// `Number of Orders`
  String get numberOfOrders {
    return Intl.message(
      'Number of Orders',
      name: 'numberOfOrders',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message('Orders', name: 'orders', desc: '', args: []);
  }

  /// `Accept Order`
  String get acceptOrder {
    return Intl.message(
      'Accept Order',
      name: 'acceptOrder',
      desc: '',
      args: [],
    );
  }

  /// `Order Shipping`
  String get orderShipping {
    return Intl.message(
      'Order Shipping',
      name: 'orderShipping',
      desc: '',
      args: [],
    );
  }

  /// `Out For Delivery`
  String get outForDelivery {
    return Intl.message(
      'Out For Delivery',
      name: 'outForDelivery',
      desc: '',
      args: [],
    );
  }

  /// `pending`
  String get pending {
    return Intl.message('pending', name: 'pending', desc: '', args: []);
  }

  /// `Delivered`
  String get delivered {
    return Intl.message('Delivered', name: 'delivered', desc: '', args: []);
  }

  /// `My Account`
  String get myAccount {
    return Intl.message('My Account', name: 'myAccount', desc: '', args: []);
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Profile Info`
  String get profileInfo {
    return Intl.message(
      'Profile Info',
      name: 'profileInfo',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message('My Orders', name: 'myOrders', desc: '', args: []);
  }

  /// `Payments`
  String get payments {
    return Intl.message('Payments', name: 'payments', desc: '', args: []);
  }

  /// `Favourites`
  String get favourites {
    return Intl.message('Favourites', name: 'favourites', desc: '', args: []);
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

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Mode`
  String get mode {
    return Intl.message('Mode', name: 'mode', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message('Light Mode', name: 'lightMode', desc: '', args: []);
  }

  /// `Help`
  String get help {
    return Intl.message('Help', name: 'help', desc: '', args: []);
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message('About Us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Add New Payment Method`
  String get addNewPaymentMethod {
    return Intl.message(
      'Add New Payment Method',
      name: 'addNewPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Add New Card`
  String get addNewCard {
    return Intl.message('Add New Card', name: 'addNewCard', desc: '', args: []);
  }

  /// `Card Number`
  String get cardNumber {
    return Intl.message('Card Number', name: 'cardNumber', desc: '', args: []);
  }

  /// `Card Holder Name`
  String get cardHolderName {
    return Intl.message(
      'Card Holder Name',
      name: 'cardHolderName',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date`
  String get expiryDate {
    return Intl.message('Expiry Date', name: 'expiryDate', desc: '', args: []);
  }

  /// `CVV`
  String get cvv {
    return Intl.message('CVV', name: 'cvv', desc: '', args: []);
  }

  /// `Add New Address`
  String get addNewAddress {
    return Intl.message(
      'Add New Address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address Line 1`
  String get addressLine1 {
    return Intl.message(
      'Address Line 1',
      name: 'addressLine1',
      desc: '',
      args: [],
    );
  }

  /// `Address Line 2`
  String get addressLine2 {
    return Intl.message(
      'Address Line 2',
      name: 'addressLine2',
      desc: '',
      args: [],
    );
  }

  /// `Make Card Default`
  String get makeCardDefault {
    return Intl.message(
      'Make Card Default',
      name: 'makeCardDefault',
      desc: '',
      args: [],
    );
  }

  /// `Make Address Default`
  String get makeAddressDefault {
    return Intl.message(
      'Make Address Default',
      name: 'makeAddressDefault',
      desc: '',
      args: [],
    );
  }

  /// `At Fruits Store, we believe that healthy living starts with fresh and natural choices. Our mission is to bring you the finest selection of fruits, handpicked with care to ensure quality and freshness.`
  String get aboutUsTextPart1 {
    return Intl.message(
      'At Fruits Store, we believe that healthy living starts with fresh and natural choices. Our mission is to bring you the finest selection of fruits, handpicked with care to ensure quality and freshness.',
      name: 'aboutUsTextPart1',
      desc: '',
      args: [],
    );
  }

  /// `We work closely with trusted farmers and suppliers who share our passion for excellence. Every fruit in our collection is carefully sourced to deliver both taste and nutrition to your table.`
  String get aboutUsTextPart2 {
    return Intl.message(
      'We work closely with trusted farmers and suppliers who share our passion for excellence. Every fruit in our collection is carefully sourced to deliver both taste and nutrition to your table.',
      name: 'aboutUsTextPart2',
      desc: '',
      args: [],
    );
  }

  /// `Our team is dedicated to creating a simple and enjoyable shopping experience. From browsing to checkout, we make it easy to discover, choose, and enjoy your favorite fruits.`
  String get aboutUsTextPart3 {
    return Intl.message(
      'Our team is dedicated to creating a simple and enjoyable shopping experience. From browsing to checkout, we make it easy to discover, choose, and enjoy your favorite fruits.',
      name: 'aboutUsTextPart3',
      desc: '',
      args: [],
    );
  }

  /// `With Fruit Store, you get more than just fruits—you get convenience, quality, and a promise of healthy living. Join us today and experience the difference of shopping with care.`
  String get aboutUsTextPart4 {
    return Intl.message(
      'With Fruit Store, you get more than just fruits—you get convenience, quality, and a promise of healthy living. Join us today and experience the difference of shopping with care.',
      name: 'aboutUsTextPart4',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to logout?`
  String get doYouWantToLogout {
    return Intl.message(
      'Do you want to logout?',
      name: 'doYouWantToLogout',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Email is required`
  String get emailIsRequired {
    return Intl.message(
      'Email is required',
      name: 'emailIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordeIsRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordeIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Full name is required`
  String get fullNameIsRequired {
    return Intl.message(
      'Full name is required',
      name: 'fullNameIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password not match`
  String get passwordNotMatch {
    return Intl.message(
      'Password not match',
      name: 'passwordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long`
  String get passwordLength {
    return Intl.message(
      'Password must be at least 8 characters long',
      name: 'passwordLength',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully, please lgoin now.`
  String get successMessageOfCreateAccount {
    return Intl.message(
      'Account created successfully, please lgoin now.',
      name: 'successMessageOfCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login successfully, welcome back.`
  String get successMessageOfLogin {
    return Intl.message(
      'Login successfully, welcome back.',
      name: 'successMessageOfLogin',
      desc: '',
      args: [],
    );
  }

  /// `Please accept terms and conditions`
  String get shouldAcceptTermsAndConditions {
    return Intl.message(
      'Please accept terms and conditions',
      name: 'shouldAcceptTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Send Email Verification`
  String get sendEmailVerification {
    return Intl.message(
      'Send Email Verification',
      name: 'sendEmailVerification',
      desc: '',
      args: [],
    );
  }

  /// `We Send reset password link to email `
  String get sendlinkToEmail {
    return Intl.message(
      'We Send reset password link to email ',
      name: 'sendlinkToEmail',
      desc: '',
      args: [],
    );
  }

  /// `Exit App`
  String get exitApp {
    return Intl.message('Exit App', name: 'exitApp', desc: '', args: []);
  }

  /// `Are you sure you want to exit?`
  String get areYouSureYouWantToExit {
    return Intl.message(
      'Are you sure you want to exit?',
      name: 'areYouSureYouWantToExit',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `Shopping Now`
  String get shoppingNow {
    return Intl.message(
      'Shopping Now',
      name: 'shoppingNow',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get results {
    return Intl.message('Results', name: 'results', desc: '', args: []);
  }

  /// `Order added successfully`
  String get orderAddedSuccess {
    return Intl.message(
      'Order added successfully',
      name: 'orderAddedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Choose Payment Method`
  String get choosePaymentMethod {
    return Intl.message(
      'Choose Payment Method',
      name: 'choosePaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `pay with PayPal`
  String get payWithPayPal {
    return Intl.message(
      'pay with PayPal',
      name: 'payWithPayPal',
      desc: '',
      args: [],
    );
  }

  /// `Payment Success`
  String get paymentSuccess {
    return Intl.message(
      'Payment Success',
      name: 'paymentSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Payment failed, please try again.`
  String get errorMessageOfPayment {
    return Intl.message(
      'Payment failed, please try again.',
      name: 'errorMessageOfPayment',
      desc: '',
      args: [],
    );
  }

  /// `Opps, something went wrong, please try again later.`
  String get errorMessage {
    return Intl.message(
      'Opps, something went wrong, please try again later.',
      name: 'errorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Payment Caceled`
  String get paymentCaceled {
    return Intl.message(
      'Payment Caceled',
      name: 'paymentCaceled',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Profile edited successfully`
  String get editProfileSuccess {
    return Intl.message(
      'Profile edited successfully',
      name: 'editProfileSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to edit profile`
  String get editProfileFailure {
    return Intl.message(
      'Failed to edit profile',
      name: 'editProfileFailure',
      desc: '',
      args: [],
    );
  }

  /// `when you change your email, we will send you an email to verify your new email address`
  String get noticOfEditEmail {
    return Intl.message(
      'when you change your email, we will send you an email to verify your new email address',
      name: 'noticOfEditEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email is not valid`
  String get emailNotValid {
    return Intl.message(
      'Email is not valid',
      name: 'emailNotValid',
      desc: '',
      args: [],
    );
  }

  /// `You can't change your email because it is already in use`
  String get notChangeEmailAlreadyExist {
    return Intl.message(
      'You can\'t change your email because it is already in use',
      name: 'notChangeEmailAlreadyExist',
      desc: '',
      args: [],
    );
  }

  /// `Please enter current password`
  String get pleaseEnterCurrentPassword {
    return Intl.message(
      'Please enter current password',
      name: 'pleaseEnterCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter new password`
  String get pleaseEnterNewPassword {
    return Intl.message(
      'Please enter new password',
      name: 'pleaseEnterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter confirm new password`
  String get pleaseEnterConfirmNewPassword {
    return Intl.message(
      'Please enter confirm new password',
      name: 'pleaseEnterConfirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully, please login again`
  String get passwordChangedReauth {
    return Intl.message(
      'Password changed successfully, please login again',
      name: 'passwordChangedReauth',
      desc: '',
      args: [],
    );
  }

  /// `we sent you an email to verify your new email address`
  String get sendLikOfChangeEmail {
    return Intl.message(
      'we sent you an email to verify your new email address',
      name: 'sendLikOfChangeEmail',
      desc: '',
      args: [],
    );
  }

  /// `Name is changed successfully`
  String get nameIsChanged {
    return Intl.message(
      'Name is changed successfully',
      name: 'nameIsChanged',
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
