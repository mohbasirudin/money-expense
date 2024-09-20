import 'package:flutter/material.dart';
import 'package:moneyexpense/app/base/assets.dart';
import 'package:moneyexpense/app/base/colors.dart';
import 'package:moneyexpense/app/db/repo/category.dart';
import 'package:moneyexpense/app/db/table/category/category.dart';
import 'package:moneyexpense/app/helper/extension/num_ext.dart';
import 'package:moneyexpense/app/routes/init.dart';
import 'package:moneyexpense/app/view/main/sub/by_category.dart';
import 'package:moneyexpense/app/view/main/sub/top.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _init();
  }

  void _init() async {
    print("data: ${500000.toRp()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubMainTop(),
            SubMainByCategory(),
          ],
        ),
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
}
