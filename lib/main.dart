import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_reproductor_video/pages/registro/registro_page.dart';
import 'package:proyecto_reproductor_video/pages/validacion_pagina_inicial/validacion_pagina_inicial.dart';
import 'package:proyecto_reproductor_video/providers/list_bloc_provider.dart';
import 'package:proyecto_reproductor_video/providers/local_storage_provider.dart';
import 'package:proyecto_reproductor_video/providers/translate_manager.dart';
import 'package:proyecto_reproductor_video/routes/routes.dart';
import 'package:proyecto_reproductor_video/theme_config/ligth_mode.dart';
import 'package:proyecto_reproductor_video/theme_config/theme_manager.dart';
import 'package:proyecto_reproductor_video/utils/SizeConfig.dart';
import 'package:proyecto_reproductor_video/utils/translation.dart';

void main() async {
  final localStorage = LocalStorage();
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage().initPrefs();
  if (Platform.isAndroid) {
    localStorage.sistemaOperativo = ("Android");
  }
  if (Platform.isIOS) {
    localStorage.sistemaOperativo = ("IOS");
  }

//Inicializamos nuestra lista de bloc
  final blocInitialize = await listBlocProvider();

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(Phoenix(child: InitApp(blocInitialized: blocInitialize)));
}


class InitApp extends StatelessWidget {
  final List<BlocProvider>? blocInitialized;

  const InitApp({Key? key, this.blocInitialized}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeManager>(
      create: (context) => ThemeManager(),
      child: ChangeNotifierProvider<TranslateManager>(
        create: (context) => TranslateManager(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MaterialAppWithTheme(blocInitialized: blocInitialized)),
      ),
    );
  }
}
 
class MaterialAppWithTheme extends StatefulWidget {
  final List<BlocProvider>? blocInitialized;

  const MaterialAppWithTheme({Key? key, this.blocInitialized})
      : super(key: key);

  @override
  State<MaterialAppWithTheme> createState() => _MaterialAppWithThemeState();
}

class _MaterialAppWithThemeState extends State<MaterialAppWithTheme> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerrKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiBlocProvider(
      providers: widget.blocInitialized!,
      child: _materialApp(context),
    );
  }

  Widget _materialApp(BuildContext context) {
    final translateManager = Provider.of<TranslateManager>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        // NO QUIT THIS COMMENT
        // builder: DevicePreview.appBuilder,
        locale: translateManager.translateMode,
        supportedLocales: const [
          Locale('es', 'US'),
          Locale('en', 'US'),
        ],

        localizationsDelegates: const [
          TranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        debugShowCheckedModeBanner: false,
        title: 'Mercaverso',
        theme: themeModeLight(),
        navigatorKey: navigatorKey, //Navegar
        scaffoldMessengerKey: messengerrKey, //Snacks
        themeMode: ThemeMode.light,
        home: const RegistroPage(),
        routes: getApplicationRoutes(),
      ),
    );
  }
}
