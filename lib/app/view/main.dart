import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyexpense/app/base/assets.dart';
import 'package:moneyexpense/app/base/colors.dart';
import 'package:moneyexpense/app/base/consts.dart';
import 'package:moneyexpense/app/routes/init.dart';
import 'package:moneyexpense/app/state/expense/expense_bloc.dart';
import 'package:moneyexpense/app/state/main/main_bloc.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  _MainAppState() {
    final router = FluroRouter();
    Routes.router = router;
    Routes.configure();
  }

  @override
  Widget build(BuildContext context) {
    final app = _bloc(
      MaterialApp(
        initialRoute: Routes.root,
        onGenerateRoute: Routes.router.generator,
        theme: ThemeData(
          canvasColor: BaseColors.light,
          fontFamily: FontFamily.sourceSansPro,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: BaseColors.primary,
          ),
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: BaseColors.primary,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: BaseColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ConstNum.radius * 0.5),
              ),
            ),
          ),
        ),
      ),
    );

    return app;
  }

  Widget _bloc(Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainBloc()),
        BlocProvider(create: (context) => ExpenseBloc()),
      ],
      child: child,
    );
  }
}
