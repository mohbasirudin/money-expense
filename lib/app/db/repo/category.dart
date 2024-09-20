import 'package:drift/drift.dart';
import 'package:moneyexpense/app/base/assets.dart';
import 'package:moneyexpense/app/base/colors.dart';
import 'package:moneyexpense/app/db/table/category/category.dart';

class LocalCategory {
  static TbCategory? _tb;

  static Future<void> _init() async => _tb = TbCategory();

  static Future<List<CategoryData>> all() async {
    if (_tb == null) await _init();
    return await _tb!.read();
  }

  static Future<void> _add(CategoryCompanion data) async {
    if (_tb == null) await _init();
    await _tb!.create(data);
  }

  static Future<void> _clear() async {
    if (_tb == null) await _init();
    await _tb!.clear();
  }

  static Future<void> sync() async {
    var data = await all();

    if (data.isEmpty) {
      var categories = [
        {
          "name": "makanan",
          "icon": BaseAssets.pizzaSlice,
          "color": ColorsCode.yellow,
        },
        {
          "name": "internet",
          "icon": BaseAssets.rssAlt,
          "color": ColorsCode.blue3,
        },
        {
          "name": "edukasi",
          "icon": BaseAssets.bookOpen,
          "color": ColorsCode.orange,
        },
        {
          "name": "hadiah",
          "icon": BaseAssets.gift,
          "color": ColorsCode.red,
        },
        {
          "name": "transport",
          "icon": BaseAssets.carSideview,
          "color": ColorsCode.purple1,
        },
        {
          "name": "belanja",
          "icon": BaseAssets.shoppingCart,
          "color": ColorsCode.green2,
        },
        {
          "name": "alat rumah",
          "icon": BaseAssets.home,
          "color": ColorsCode.purple2,
        },
        {
          "name": "olahraga",
          "icon": BaseAssets.basketBall,
          "color": ColorsCode.blue2,
        },
        {
          "name": "hiburan",
          "icon": BaseAssets.clapperBoard,
          "color": ColorsCode.blue1,
        },
      ];

      print("category: ${categories.length}");

      for (var i = 0; i < categories.length; i++) {
        var category = categories[i];
        var data = CategoryCompanion(
          id: Value(i),
          color: Value(category['color'] ?? ColorsCode.primary),
          name: Value(category['name'] ?? "-"),
          icon: Value(category['icon'] ?? BaseAssets.pizzaSlice),
        );
        await _add(data);
      }
    }
  }
}
