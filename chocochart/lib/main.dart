import 'package:chocochart/providers/payload.dart';
import 'package:chocochart/providers/token.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'appRouter.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';
void main() {
  /// Specifies the set of orientations the application interface can be displayed in.
  /// The orientation argument is a list of DeviceOrientation enum values.
  /// The empty list causes the application to defer to the operating system default.
  /// Reference: https://api.flutter.dev/flutter/services/SystemChrome/setPreferredOrientations.html
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async {
    configureApp();
    runApp(MyApp(lang: "TH"));
  });;
}

class MyApp extends StatelessWidget {
  final AppRouter router = AppRouter();
  final String lang;

  MyApp({Key? key, required this.lang}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TokenProvider()),
        ChangeNotifierProvider(create: (_) => PayloadProvider()),
      ],
      child: MaterialApp(
        title: 'EPP App',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('th') // Thailand
        ],
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 172, 204, 229),
          scaffoldBackgroundColor: const Color.fromARGB(255, 172, 204, 229),
          fontFamily: 'PromptMedium',
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontFamily: 'Prompt-Medium',
              fontSize: 24,
              color: Colors.white,
            ), // AppBar
            titleMedium: TextStyle(
              fontFamily: 'Prompt-Medium',
              fontSize: 20,
              color: Colors.white,
            ), // Head Detail
            titleSmall: TextStyle(
              fontFamily: 'Prompt-Medium',
              fontSize: 18,
              color: Colors.white,
            ), // Head Promotion
            headlineMedium: TextStyle(
              fontFamily: 'Prompt-Medium',
              fontSize: 20,
              color: Color.fromARGB(255, 14, 90, 171),
            ), // Head PopUp
            headlineSmall: TextStyle(
              fontFamily: 'Prompt-Medium',
              fontSize: 16,
              color: Color.fromARGB(255, 14, 90, 171),
            ), // title Detail
            labelSmall: TextStyle(
              fontFamily: 'Prompt-Regular',
              fontSize: 14,
              color: Color.fromARGB(255, 0, 0, 0),
            ), // Text fields label
            displaySmall: TextStyle(
              fontFamily: 'Prompt-Regular',
              fontSize: 14,
              color: Color.fromRGBO(110, 196, 226, 100),
            ), // Text fields label Contact
            labelMedium: TextStyle(
              fontFamily: 'Prompt-Regular',
              fontSize: 18,
              color: Color.fromARGB(255, 14, 90, 171),
            ), //  menu profile
            bodyLarge: TextStyle(
              fontFamily: 'Prompt-Light',
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Color.fromRGBO(112, 112, 112, 1),
            ), // Text fields
            bodyMedium: TextStyle(
              fontFamily: 'Prompt-Light',
              fontSize: 16,
              color: Color.fromRGBO(0, 0, 0, .7),
            ),
            bodySmall: TextStyle(
              fontFamily: 'Prompt-Light',
              fontSize: 14,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
            // Detail Body
          ),
        ),
        onGenerateRoute: router.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
