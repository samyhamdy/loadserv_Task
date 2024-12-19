import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/app_themes/app_theme.dart';
import 'core/main_services/locator.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class App extends StatelessWidget {
  final AppRouter appRouter;
  const App({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'App',
        theme: AppTheme.themeData,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.categoryDetailsScreen,
        onGenerateRoute: appRouter.generateRoute,
        navigatorKey: navigatorKey,
      ),
    );
  }
}
