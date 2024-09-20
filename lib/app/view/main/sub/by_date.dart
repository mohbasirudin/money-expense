import 'package:flutter/material.dart';
import 'package:moneyexpense/app/base/colors.dart';
import 'package:moneyexpense/app/base/consts.dart';
import 'package:moneyexpense/app/db/table/expense/expense.dart';
import 'package:moneyexpense/app/helper/extension/num_ext.dart';
import 'package:moneyexpense/app/helper/extension/string_ext.dart';
import 'package:moneyexpense/app/helper/extension/widget_ext.dart';
import 'package:moneyexpense/app/state/main/main_bloc.dart';
import 'package:moneyexpense/app/widget/empty.dart';
import 'package:moneyexpense/app/widget/text.dart';

class SubMainByDate extends StatefulWidget {
  final MainSuccess state;

  const SubMainByDate(this.state, {super.key});

  @override
  State<SubMainByDate> createState() => _SubMainByDateState();
}

class _SubMainByDateState extends State<SubMainByDate> {
  late MainSuccess state;

  @override
  Widget build(BuildContext context) {
    state = widget.state;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _title(ConstString.today),
        _subBody(state.today),
        _title(ConstString.yesterday),
        _subBody(state.yesterday),
      ],
    ).padding(const EdgeInsets.symmetric(
      horizontal: ConsPadding.large,
    ));
  }

  Widget _title(String text) {
    return CText(
      text,
      fontWeight: FontWeight.w700,
    ).padding(
      const EdgeInsets.only(
        bottom: ConsPadding.large,
      ),
    );
  }

  Widget _subBody(List<ExpenseData> data) {
    if (data.isEmpty) return const PageEmpty(height: 240);
    return ListView.separated(
      itemBuilder: (context, index) {
        return _item(data[index]);
      },
      separatorBuilder: (context, index) => Container(
        height: ConsPadding.medium * 0.5,
      ),
      itemCount: data.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(
        bottom: ConsPadding.large,
      ),
    );
  }

  Widget _item(ExpenseData data) {

    return Container(
      padding: EdgeInsets.all(ConsPadding.medium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ConstNum.radius),
        color: BaseColors.light,
        boxShadow: [
          BoxShadow(
            spreadRadius: 8,
            blurRadius: 8,
            offset: Offset(4, 4),
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(
              data.categoryIcon,
              color: data.categoryColor.color(),
            ),
          ),
          CText(
            data.name.toCapitalized(),
          )
              .padding(const EdgeInsets.symmetric(
                horizontal: ConsPadding.medium,
              ))
              .expanded(),
          CText(
            num.parse(data.nominal).toRp(),
            fontWeight: FontWeight.w600,
          ),
        ],
      ).padding(
        const EdgeInsets.all(
          ConsPadding.medium,
        ),
      ),
    );
  }
}
