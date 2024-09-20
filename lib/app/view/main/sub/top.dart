import 'package:flutter/material.dart';
import 'package:moneyexpense/app/base/colors.dart';
import 'package:moneyexpense/app/base/consts.dart';
import 'package:moneyexpense/app/helper/extension/num_ext.dart';
import 'package:moneyexpense/app/helper/extension/widget_ext.dart';
import 'package:moneyexpense/app/state/main/main_bloc.dart';
import 'package:moneyexpense/app/widget/text.dart';

class SubMainTop extends StatefulWidget {
  final MainSuccess state;

  const SubMainTop(
    this.state, {
    super.key,
  });

  @override
  State<SubMainTop> createState() => _SubMainTopState();
}

class _SubMainTopState extends State<SubMainTop> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CText(
          "${ConstString.halo}, Basir!",
          fontSize: FontSize.large + 2,
          fontWeight: FontWeight.w700,
        ).padding(
          const EdgeInsets.only(
            top: ConsPadding.medium * 4,
          ),
        ),
        CText(
          ConstString.mainMessage,
          color: BaseColors.gray3,
        ).padding(
          const EdgeInsets.only(
            bottom: ConsPadding.large,
          ),
        ),
        Row(
          children: [
            _item(
              ConstString.expenseToday,
              nominal: widget.state.amountToday.toRp(),
              color: BaseColors.primary,
            ).expanded(),
            const SizedBox(
              width: ConsPadding.large,
            ),
            _item(
              ConstString.expenseThisMonth,
              nominal: widget.state.amountThisMonth.toRp(),
              color: BaseColors.green2,
            ).expanded(),
          ],
        )
      ],
    ).padding(
      const EdgeInsets.symmetric(
        horizontal: ConsPadding.large,
      ),
    );
  }

  Widget _item(
    String text, {
    required String nominal,
    required Color color,
  }) {
    return Container(
      height: 97.0,
      padding: const EdgeInsets.all(
        ConsPadding.medium,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          ConstNum.radius,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CText(
            text,
            color: BaseColors.light,
            fontWeight: FontWeight.w400,
          ),
          const Spacer(),
          CText(
            nominal,
            color: BaseColors.light,
            fontWeight: FontWeight.w700,
            fontSize: FontSize.large,
          ),
        ],
      ),
    );
  }
}
