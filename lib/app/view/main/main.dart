import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyexpense/app/base/assets.dart';
import 'package:moneyexpense/app/base/colors.dart';
import 'package:moneyexpense/app/db/repo/category.dart';
import 'package:moneyexpense/app/db/table/category/category.dart';
import 'package:moneyexpense/app/helper/extension/num_ext.dart';
import 'package:moneyexpense/app/routes/init.dart';
import 'package:moneyexpense/app/state/main/main_bloc.dart';
import 'package:moneyexpense/app/view/main/sub/by_category.dart';
import 'package:moneyexpense/app/view/main/sub/by_date.dart';
import 'package:moneyexpense/app/view/main/sub/top.dart';
import 'package:moneyexpense/app/widget/error.dart';
import 'package:moneyexpense/app/widget/loading.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  late MainBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _init();
  }

  void _init() async {
    bloc = context.read<MainBloc>();
    bloc.add(OnMainInit());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is MainLoading) return const PageLoading();
          if (state is MainError) return const PageError();
          if (state is MainSuccess) return _body(state);
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goto(Routes.add, context: context);
        },
        mini: true,
        shape: const CircleBorder(),
        child: Image.asset(
          BaseAssets.plus,
          color: BaseColors.light,
        ),
      ),
    );
  }

  Widget _body(MainSuccess state) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubMainTop(state),
          SubMainByCategory(state),
          SubMainByDate(state),
        ],
      ),
    );
  }
}
