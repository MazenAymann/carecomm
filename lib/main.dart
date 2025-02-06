import 'package:carecomm/utils/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'utils/helpers/app_provider.dart';
import 'utils/helpers/di.dart';

void main() {
  setupLocator();
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return AppProvider(appRouter: appRouter);
  }
}
