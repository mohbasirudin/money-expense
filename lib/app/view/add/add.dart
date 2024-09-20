import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moneyexpense/app/base/assets.dart';
import 'package:moneyexpense/app/base/colors.dart';
import 'package:moneyexpense/app/base/consts.dart';
import 'package:moneyexpense/app/helper/extension/string_ext.dart';
import 'package:moneyexpense/app/helper/extension/widget_ext.dart';
import 'package:moneyexpense/app/helper/func/func.dart';
import 'package:moneyexpense/app/helper/func/globals.dart';
import 'package:moneyexpense/app/state/expense/expense_bloc.dart';
import 'package:moneyexpense/app/view/add/sub/category.dart';
import 'package:moneyexpense/app/widget/button_elevated.dart';
import 'package:moneyexpense/app/widget/error.dart';
import 'package:moneyexpense/app/widget/field.dart';
import 'package:moneyexpense/app/widget/icon_field.dart';
import 'package:moneyexpense/app/widget/loading.dart';
import 'package:moneyexpense/app/widget/text.dart';

class PageAdd extends StatefulWidget {
  const PageAdd({super.key});

  @override
  State<PageAdd> createState() => _PageAddState();
}

class _PageAddState extends State<PageAdd> {
  late ExpenseBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.add(OnExpenseReset());
  }

  void _onInit() {
    bloc = context.read<ExpenseBloc>();
    bloc.add(OnExpenseInit());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const CText(
            ConstString.addNewExpense,
            fontWeight: FontWeight.w700,
            fontSize: FontSize.large,
          ),
        ),
        body: BlocBuilder<ExpenseBloc, ExpenseState>(
          builder: (_, state) {
            if (state is ExpenseLoading) return const PageLoading();
            if (state is ExpenseError) return const PageError();
            if (state is ExpenseSuccess) return _body(state);
            return Container();
          },
        ));
  }

  Widget _body(ExpenseSuccess state) {
    var category = state.categories[state.copy().indexCategory];
    var enabled = state.copy().enabled;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(ConsPadding.large),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _form(
            hint: ConstString.expenceName,
            controller: bloc.conName,
            onChanged: (value) {
              bloc.add(OnExpenseChangeName());
            },
          ),
          _form(
            controller: bloc.conCategory,
            readOnly: true,
            preffix: IconField(
              category.icon,
              color: category.color.color(),
            ),
            suffix: Builder(
              builder: (context) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: ConsPadding.medium,
                  ),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: BaseColors.outline,
                  ),
                  child: Center(
                    child: IconField(BaseAssets.angleLeftB),
                  ),
                ).onTap(() {
                  showModalBottomSheet(
                    context: context,
                    barrierColor: Colors.black26,
                    builder: (context) {
                      return SubMenuAddCategory(
                        categories: state.categories,
                        onSubmit: (index) {
                          bloc.add(OnExpenseChangeCategory(index));
                        },
                      );
                    },
                  );
                });
              },
            ),
          ),
          _form(
            controller: bloc.conDate,
            readOnly: true,
            hint: ConstString.expenceDate,
            suffix: IconField(
              BaseAssets.calendarAlt,
            ).onTap(() async {
              var initial = DateTime.now();
              var cDate = state.copy().expenseDate;
              if (cDate.isNotEmpty) {
                initial = DateTime.parse(cDate);
              }
              var today = DateTime.now();
              var interval = const Duration(days: 30);
              var result = await showDatePicker(
                context: context,
                initialDate: initial,
                firstDate: today.subtract(interval),
                lastDate: today,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                locale: const Locale("id", "ID"),
              );
              if (result != null) {
                bloc.add(OnExpenseChangeDate(result.toString()));
              }
            }),
          ),
          _form(
            controller: bloc.conNominal,
            hint: ConstString.nominal,
            type: TextInputType.number,
            onChanged: (value) {
              bloc.add(OnExpenseChangeNominal());
            },
          ),
          ButtonElevated(
            ConstString.save,
            enabled: enabled,
            padding: const EdgeInsets.only(
              top: ConsPadding.medium,
            ),
            onTap: () {
              bloc.add(OnExpenseSave((result) {
                snackbar(context, result);
                if (result) bloc.add(OnExpenseReload());
              }));
            },
          ),
        ],
      ),
    );
  }

  Widget _form({
    String hint = "",
    Widget? suffix,
    Widget? preffix,
    bool readOnly = false,
    TextEditingController? controller,
    TextInputType? type,
    Function(String value)? onChanged,
  }) {
    return CField(
      controller: controller,
      hint: hint,
      suffix: suffix,
      preffix: preffix,
      readOnly: readOnly,
      type: type,
      onChanged: onChanged,
      padding: const EdgeInsets.only(
        bottom: ConsPadding.medium,
      ),
    );
  }
}
