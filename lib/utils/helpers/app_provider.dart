import 'package:carecomm/modules/bloc/products_bloc.dart';
import 'package:carecomm/utils/helpers/di.dart';
import 'package:carecomm/utils/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsBloc>(
            create: (context) =>
                getIt<ProductsBloc>()..add(FetchProductsEvent())),
      ],
      child: MaterialApp(
        title: 'CareComm',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
