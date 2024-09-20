import 'package:flutter/material.dart';
import 'package:moneyexpense/app/base/assets.dart';
import 'package:moneyexpense/app/base/colors.dart';
import 'package:moneyexpense/app/base/consts.dart';
import 'package:moneyexpense/app/db/table/category/category.dart';
import 'package:moneyexpense/app/helper/extension/string_ext.dart';
import 'package:moneyexpense/app/helper/extension/widget_ext.dart';
import 'package:moneyexpense/app/widget/text.dart';

class SubMenuAddCategory extends StatefulWidget {
  final List<CategoryData> categories;
  final Function(int index) onSubmit;

  const SubMenuAddCategory({
    required this.categories,
    required this.onSubmit,
    super.key,
  });

  @override
  State<SubMenuAddCategory> createState() => _SubMenuAddCategoryState();
}

class _SubMenuAddCategoryState extends State<SubMenuAddCategory> {
  @override
  Widget build(BuildContext context) {
    var categories = widget.categories;
    return Container(
      padding: const EdgeInsets.only(
        top: ConsPadding.large,
      ),
      decoration: BoxDecoration(
        color: BaseColors.light,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(ConstNum.radius),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const CText(
                ConstString.chooseCategory,
                fontWeight: FontWeight.w600,
              ).expanded(),
              Image.asset(BaseAssets.multiply).onTap(
                () => Navigator.pop(context),
              ),
            ],
          ).padding(const EdgeInsets.symmetric(
            horizontal: ConsPadding.large * 1.75,
          )),
          GridView.builder(
            itemCount: categories.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: ConsPadding.medium * 0.5,
              mainAxisSpacing: ConsPadding.medium * 0.5,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (context, index) {
              return _item(categories[index], index);
            },
            padding: const EdgeInsets.only(
              top: ConsPadding.medium * 1.2,
              bottom: ConsPadding.large,
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(CategoryData data, int index) {
    return Container(
      color: BaseColors.light,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 36,
            height: 36,
            margin: const EdgeInsets.only(
              bottom: ConsPadding.medium * 0.25,
            ),
            decoration: BoxDecoration(
              color: data.color.color(),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                data.icon,
              ),
            ),
          ),
          CText(
            data.name.toCapitalized(),
            fontSize: FontSize.small,
          ),
        ],
      ),
    ).onTap(() {
      widget.onSubmit(index);
      Navigator.pop(context);
    });
  }
}
