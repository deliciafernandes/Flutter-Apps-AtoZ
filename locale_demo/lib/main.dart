// A simple "rough and ready" example of localizing a Flutter app.
// Spanish and English (locale language codes 'en' and 'es') are
// supported.

// The pubspec.yaml file must include flutter_localizations in its
// dependencies section. For example:
//
// dependencies:
//   flutter:
//     sdk: flutter
//   flutter_localizations:
//     sdk: flutter

// If you run this app with the device's locale set to anything but
// English or Spanish, the app's locale will be English. If you
// set the device's locale to Spanish, the app's locale will be
// Spanish.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Screen1.dart';

class DemoLocalizations {
//  DemoLocalizations(this.locale);

  final Locale locale = Locale('mr', 'IN');

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Hello World',
    },
    'hi': {
      'title': 'नमस्ते दुनिया',
    },
    'mr': {
      'title': 'हॅलो वर्ल्ड',
    },
    '	ta': {
      'title': 'ஹலோ வேர்ல்ட்',
    },
    '	te': {
      'title': 'హలో వరల్డ్',
    },
//    'title': 'Hola Mundo',
//    },
//    '': {
//      'title': '',
//    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations());
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalizations.of(context).title),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(DemoLocalizations.of(context).title),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/first');
                },
                color: Colors.blueAccent,
                child: Text('Next page >'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) =>
          DemoLocalizations.of(context).title,
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      // Watch out: MaterialApp creates a Localizations widget
      // with the specified delegates. DemoLocalizations.of()
      // will only find the app's Localizations widget if its
      // context is a child of the app.
      debugShowCheckedModeBanner: false,
      initialRoute: '/first',
      routes: {
        '/': (context) => DemoApp(),
        '/first': (context) => Screen1(),
      },
    );
  }
}

void main() {
  runApp(Demo());
}
