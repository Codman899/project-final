import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routing/router.dart';
import 'shared/theme/controllers/theme_controller.dart';
import 'shared/theme/core/flex_theme_dark.dart';
import 'shared/theme/core/flex_theme_light.dart';
import 'shared/theme/core/theme_data_dark.dart';
import 'shared/theme/core/theme_data_light.dart';

/// The Widget that configures your application.
class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
    required this.controller,
  });

  final ThemeController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: controller,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          routerConfig: router,
          // routerDelegate: router.routerDelegate,
          // routeInformationParser: router.routeInformationParser,
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: [
            // AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          // onGenerateTitle: (BuildContext context) =>
          //     AppLocalizations.of(context)!.appTitle,

          //* debug banner
          debugShowCheckedModeBanner: true,
          // The Theme controller controls if we use FlexColorScheme made
          // ThemeData or standard SDK ThemeData. It also
          // controls all the configuration parameters used to define the
          // FlexColorScheme object that produces the ThemeData object.

          theme: controller.useFlexColorScheme
              ? flexThemeLight(controller)
              : themeDataLight(controller),
          darkTheme: controller.useFlexColorScheme
              ? flexThemeDark(controller)
              : themeDataDark(controller),
          // Use the dark/light theme based on controller setting.
          themeMode: controller.themeMode,
          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          // theme: ThemeData(),
          // darkTheme: ThemeData.dark(),
          // theme: FlexThemeData.light(
          //   scheme: FlexScheme.materialBaseline,
          //   appBarElevation: 0.5,
          //   typography: Typography.material2021(
          //     platform: defaultTargetPlatform,
          //   ),
          //   surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          //   blendLevel: 7,
          //   subThemesData: const FlexSubThemesData(
          //     blendOnLevel: 10,
          //     blendOnColors: false,
          //     useTextTheme: true,
          //     useM2StyleDividerInM3: true,
          //     alignedDropdown: true,
          //     useInputDecoratorThemeInDialogs: true,
          //   ),
          //   visualDensity: FlexColorScheme.comfortablePlatformDensity,
          //   useMaterial3: false,
          //   swapLegacyOnMaterial3: true,
          // ),
          // darkTheme: FlexThemeData.dark(
          //   scheme: FlexScheme.materialBaseline,
          //   appBarElevation: 0.5,
          //   typography:
          //       Typography.material2021(platform: defaultTargetPlatform),
          //   surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          //   blendLevel: 13,
          //   subThemesData: const FlexSubThemesData(
          //     blendOnLevel: 20,
          //     useTextTheme: true,
          //     useM2StyleDividerInM3: true,
          //     alignedDropdown: true,
          //     useInputDecoratorThemeInDialogs: true,
          //   ),
          //   visualDensity: FlexColorScheme.comfortablePlatformDensity,
          //   useMaterial3: true,
          //   swapLegacyOnMaterial3: true,
          //   // To use the Playground font, add GoogleFonts package and uncomment
          //   // fontFamily: GoogleFonts.notoSans().fontFamily,
          // ),
          // themeMode: settingsController.themeMode,
        );
      },
    );
  }
}
