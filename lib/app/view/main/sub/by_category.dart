import 'package:flutter/material.dart';
import 'package:moneyexpense/app/base/colors.dart';
import 'package:moneyexpense/app/base/consts.dart';
import 'package:moneyexpense/app/db/model/expense_by_category.dart';
import 'package:moneyexpense/app/db/repo/expense.dart';
import 'package:moneyexpense/app/db/table/expense/expense.dart';
import 'package:moneyexpense/app/helper/extension/num_ext.dart';
import 'package:moneyexpense/app/helper/extension/string_ext.dart';
import 'package:moneyexpense/app/helper/extension/widget_ext.dart';
import 'package:moneyexpense/app/state/main/main_bloc.dart';
import 'package:moneyexpense/app/widget/empty.dart';
import 'package:moneyexpense/app/widget/text.dart';

class SubMainByCategory extends StatefulWidget {
  final MainSuccess state;

  const SubMainByCategory(this.state, {super.key});

  @override
  State<SubMainByCategory> createState() => _SubMainByCategoryState();
}

class _SubMainByCategoryState extends State<SubMainByCategory> {
  late MainSuccess state;

  @override
  Widget build(BuildContext context) {
    state = widget.state;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CText(
          ConstString.expenseByCategory,
          fontWeight: FontWeight.w700,
        ).padding(
          const EdgeInsets.only(
            left: ConsPadding.large,
            right: ConsPadding.large,
            top: ConsPadding.large,
            bottom: ConsPadding.medium * 0.5,
          ),
        ),
        SizedBox(
          height: 145,
          width: double.infinity,
          child: _body(),
        ),
      ],
    );
  }

  Widget _body() {
    if (state.expensesByCategory.isEmpty) {
      return const PageEmpty().padding(const EdgeInsets.symmetric(
        horizontal: ConsPadding.large,
        vertical: ConsPadding.medium,
      ));
    }
    return ListView.separated(
      itemBuilder: (context, index) => _item(
        state.expensesByCategory[index],
      ),
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: ConsPadding.medium,
        );
      },
      itemCount: state.expensesByCategory.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: ConsPadding.large,
      ),
    );
  }

  Widget _item(ItemExpenseByCategory data) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: ConsPadding.medium,
      ),
      width: 110,
      padding: const EdgeInsets.all(
        ConsPadding.medium,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ConstNum.radius),
        color: BaseColors.light,
        boxShadow: [
          BoxShadow(
            spreadRadius: 4,
            blurRadius: 8,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: data.color.color(),
            ),
            child: Center(
              child: Image.asset(
                data.icon,
              ),
            ),
          ),
          CText(
            data.name,
            fontWeight: FontWeight.w400,
            color: BaseColors.hint,
            fontSize: FontSize.small,
          ),
          CText(
            data.amount.toRp(),
            fontWeight: FontWeight.w700,
            fontSize: FontSize.small,
          ),
        ],
      ),
    );
  }
}
