import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyexpense/app/state/main/main_bloc.dart';

class Sync {
  static Future<void> main(BuildContext context) async {
    final main = context.read<MainBloc>();
    main.add(OnMainInit());
  }
}
