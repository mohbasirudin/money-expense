import 'package:flutter/material.dart';
import 'package:moneyexpense/app/base/consts.dart';
import 'package:moneyexpense/app/db/table/expense/expense.dart';
import 'package:moneyexpense/app/state/main/main_bloc.dart';
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
      mainAxisSize: MainAxisSize.min,
      children: [
        _title(ConstString.today),
        _subBody(state.today),
        _title(ConstString.yesterday),
        _subBody(state.yesterday),
      ],
    );
  }

  Widget _title(String text) {
    return CText(
      text,
      fontWeight: FontWeight.w700,
    );
  }

  Widget _subBody(List<ExpenseData> data) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return _item(data[index]);
      },
      separatorBuilder: (context, index) => Container(
        height: 20,
      ),
      itemCount: data.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Widget _item(ExpenseData data) {
    return Card(
      child: Row(
        children: [
        ],
      ),
    );
  }
}
