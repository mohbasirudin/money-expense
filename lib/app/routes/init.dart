import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:moneyexpense/app/view/add/add.dart';
import 'package:moneyexpense/app/view/main/main.dart';
import 'package:moneyexpense/app/widget/text.dart';

class Routes {
  static late final FluroRouter router;

  static const root = "/";
  static const add = "/add";

  static void configure() {
    router.notFoundHandler = _handler((_, params) {
      return const CText("Not Found!");
    });

    _routes(root, (params) => const PageHome());
    _routes(add, (params) => const PageAdd());
  }

  static _routes(
    String path,
    Widget Function(Map params) builder,
  ) {
    router.define(path, handler: _handler((_, params) {
      return builder(params);
    }));
  }

  static Handler _handler(
      Widget Function(
        BuildContext? _,
        Map params,
      ) builder) {
    return Handler(
      handlerFunc: (context, parameters) {
        var params = (context!.settings!.arguments ?? {}) as Map;
        return builder(context, params);
      },
    );
  }
}

final router = Routes.router;

Future<dynamic> goto(
  String path, {
  required BuildContext context,
  Map? params,
  Function(dynamic r)? onResult,
}) async {
  var result = await router.navigateTo(
    context,
    path,
    transition: TransitionType.inFromRight,
    routeSettings: RouteSettings(
      name: path,
      arguments: params,
    ),
  );
  if (result != null) {
    return result;
  }
  return null;
}
