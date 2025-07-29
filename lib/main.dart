import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Config/Router/routeManger.dart';
import 'Config/Router/routes.dart';

void main() {
  runApp(Muslim(),
  );
}

class Muslim extends StatelessWidget {
  const Muslim({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar'),
          supportedLocales: const [
            Locale('ar'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialRoute: Routes.Splash,
          routes: RouteManager.routes, // Use the map here
          onGenerateRoute: RouteManager.generateRoute, // Use the function here
        );
      },
    );
  }
}