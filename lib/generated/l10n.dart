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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Settings`
  String get tSettings {
    return Intl.message(
      'Settings',
      name: 'tSettings',
      desc: '',
      args: [],
    );
  }

  /// `Voice`
  String get tvoice {
    return Intl.message(
      'Voice',
      name: 'tvoice',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get tcontactus {
    return Intl.message(
      'Contact Us',
      name: 'tcontactus',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get thelp {
    return Intl.message(
      'Help',
      name: 'thelp',
      desc: '',
      args: [],
    );
  }

  /// `About App`
  String get taboutapp {
    return Intl.message(
      'About App',
      name: 'taboutapp',
      desc: '',
      args: [],
    );
  }

  /// `About ECCAT`
  String get tabouteccat {
    return Intl.message(
      'About ECCAT',
      name: 'tabouteccat',
      desc: '',
      args: [],
    );
  }

  /// `Hi ,Dear`
  String get tohidear {
    return Intl.message(
      'Hi ,Dear',
      name: 'tohidear',
      desc: '',
      args: [],
    );
  }

  /// `Home Page`
  String get thomepage {
    return Intl.message(
      'Home Page',
      name: 'thomepage',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get tomap {
    return Intl.message(
      'Map',
      name: 'tomap',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get tolocation {
    return Intl.message(
      'Location',
      name: 'tolocation',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get tname {
    return Intl.message(
      'Name',
      name: 'tname',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get temail {
    return Intl.message(
      'Email',
      name: 'temail',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get tgender {
    return Intl.message(
      'Gender',
      name: 'tgender',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get tedit {
    return Intl.message(
      'Edit',
      name: 'tedit',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get tdone {
    return Intl.message(
      'Done',
      name: 'tdone',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get tphonenum {
    return Intl.message(
      'Phone Number',
      name: 'tphonenum',
      desc: '',
      args: [],
    );
  }

  /// `Role`
  String get trole {
    return Intl.message(
      'Role',
      name: 'trole',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get tChangeLanguage {
    return Intl.message(
      'Change Language',
      name: 'tChangeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get tdarkmode {
    return Intl.message(
      'Dark Mode',
      name: 'tdarkmode',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get Signout {
    return Intl.message(
      'Sign Out',
      name: 'Signout',
      desc: '',
      args: [],
    );
  }

  /// `Patient_profile`
  String get tPatient_profile {
    return Intl.message(
      'Patient_profile',
      name: 'tPatient_profile',
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
      Locale.fromSubtags(languageCode: 'ch'),
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
