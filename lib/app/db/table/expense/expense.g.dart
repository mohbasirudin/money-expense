// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// ignore_for_file: type=lint
class $ExpenseTable extends Expense with TableInfo<$ExpenseTable, ExpenseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpenseTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nominalMeta =
      const VerificationMeta('nominal');
  @override
  late final GeneratedColumn<String> nominal = GeneratedColumn<String>(
      'nominal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryNameMeta =
      const VerificationMeta('categoryName');
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
      'category_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryIconMeta =
      const VerificationMeta('categoryIcon');
  @override
  late final GeneratedColumn<String> categoryIcon = GeneratedColumn<String>(
      'category_icon', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryColorMeta =
      const VerificationMeta('categoryColor');
  @override
  late final GeneratedColumn<String> categoryColor = GeneratedColumn<String>(
      'category_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, date, nominal, categoryName, categoryIcon, categoryColor];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expense';
  @override
  VerificationContext validateIntegrity(Insertable<ExpenseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('nominal')) {
      context.handle(_nominalMeta,
          nominal.isAcceptableOrUnknown(data['nominal']!, _nominalMeta));
    } else if (isInserting) {
      context.missing(_nominalMeta);
    }
    if (data.containsKey('category_name')) {
      context.handle(
          _categoryNameMeta,
          categoryName.isAcceptableOrUnknown(
              data['category_name']!, _categoryNameMeta));
    } else if (isInserting) {
      context.missing(_categoryNameMeta);
    }
    if (data.containsKey('category_icon')) {
      context.handle(
          _categoryIconMeta,
          categoryIcon.isAcceptableOrUnknown(
              data['category_icon']!, _categoryIconMeta));
    } else if (isInserting) {
      context.missing(_categoryIconMeta);
    }
    if (data.containsKey('category_color')) {
      context.handle(
          _categoryColorMeta,
          categoryColor.isAcceptableOrUnknown(
              data['category_color']!, _categoryColorMeta));
    } else if (isInserting) {
      context.missing(_categoryColorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpenseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
      nominal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nominal'])!,
      categoryName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_name'])!,
      categoryIcon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_icon'])!,
      categoryColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_color'])!,
    );
  }

  @override
  $ExpenseTable createAlias(String alias) {
    return $ExpenseTable(attachedDatabase, alias);
  }
}

class ExpenseData extends DataClass implements Insertable<ExpenseData> {
  final int id;
  final String name;
  final String date;
  final String nominal;
  final String categoryName;
  final String categoryIcon;
  final String categoryColor;
  const ExpenseData(
      {required this.id,
      required this.name,
      required this.date,
      required this.nominal,
      required this.categoryName,
      required this.categoryIcon,
      required this.categoryColor});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['date'] = Variable<String>(date);
    map['nominal'] = Variable<String>(nominal);
    map['category_name'] = Variable<String>(categoryName);
    map['category_icon'] = Variable<String>(categoryIcon);
    map['category_color'] = Variable<String>(categoryColor);
    return map;
  }

  ExpenseCompanion toCompanion(bool nullToAbsent) {
    return ExpenseCompanion(
      id: Value(id),
      name: Value(name),
      date: Value(date),
      nominal: Value(nominal),
      categoryName: Value(categoryName),
      categoryIcon: Value(categoryIcon),
      categoryColor: Value(categoryColor),
    );
  }

  factory ExpenseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      date: serializer.fromJson<String>(json['date']),
      nominal: serializer.fromJson<String>(json['nominal']),
      categoryName: serializer.fromJson<String>(json['categoryName']),
      categoryIcon: serializer.fromJson<String>(json['categoryIcon']),
      categoryColor: serializer.fromJson<String>(json['categoryColor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'date': serializer.toJson<String>(date),
      'nominal': serializer.toJson<String>(nominal),
      'categoryName': serializer.toJson<String>(categoryName),
      'categoryIcon': serializer.toJson<String>(categoryIcon),
      'categoryColor': serializer.toJson<String>(categoryColor),
    };
  }

  ExpenseData copyWith(
          {int? id,
          String? name,
          String? date,
          String? nominal,
          String? categoryName,
          String? categoryIcon,
          String? categoryColor}) =>
      ExpenseData(
        id: id ?? this.id,
        name: name ?? this.name,
        date: date ?? this.date,
        nominal: nominal ?? this.nominal,
        categoryName: categoryName ?? this.categoryName,
        categoryIcon: categoryIcon ?? this.categoryIcon,
        categoryColor: categoryColor ?? this.categoryColor,
      );
  @override
  String toString() {
    return (StringBuffer('ExpenseData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('nominal: $nominal, ')
          ..write('categoryName: $categoryName, ')
          ..write('categoryIcon: $categoryIcon, ')
          ..write('categoryColor: $categoryColor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, date, nominal, categoryName, categoryIcon, categoryColor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseData &&
          other.id == this.id &&
          other.name == this.name &&
          other.date == this.date &&
          other.nominal == this.nominal &&
          other.categoryName == this.categoryName &&
          other.categoryIcon == this.categoryIcon &&
          other.categoryColor == this.categoryColor);
}

class ExpenseCompanion extends UpdateCompanion<ExpenseData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> date;
  final Value<String> nominal;
  final Value<String> categoryName;
  final Value<String> categoryIcon;
  final Value<String> categoryColor;
  const ExpenseCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.date = const Value.absent(),
    this.nominal = const Value.absent(),
    this.categoryName = const Value.absent(),
    this.categoryIcon = const Value.absent(),
    this.categoryColor = const Value.absent(),
  });
  ExpenseCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String date,
    required String nominal,
    required String categoryName,
    required String categoryIcon,
    required String categoryColor,
  })  : name = Value(name),
        date = Value(date),
        nominal = Value(nominal),
        categoryName = Value(categoryName),
        categoryIcon = Value(categoryIcon),
        categoryColor = Value(categoryColor);
  static Insertable<ExpenseData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? date,
    Expression<String>? nominal,
    Expression<String>? categoryName,
    Expression<String>? categoryIcon,
    Expression<String>? categoryColor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (date != null) 'date': date,
      if (nominal != null) 'nominal': nominal,
      if (categoryName != null) 'category_name': categoryName,
      if (categoryIcon != null) 'category_icon': categoryIcon,
      if (categoryColor != null) 'category_color': categoryColor,
    });
  }

  ExpenseCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? date,
      Value<String>? nominal,
      Value<String>? categoryName,
      Value<String>? categoryIcon,
      Value<String>? categoryColor}) {
    return ExpenseCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      nominal: nominal ?? this.nominal,
      categoryName: categoryName ?? this.categoryName,
      categoryIcon: categoryIcon ?? this.categoryIcon,
      categoryColor: categoryColor ?? this.categoryColor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (nominal.present) {
      map['nominal'] = Variable<String>(nominal.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    if (categoryIcon.present) {
      map['category_icon'] = Variable<String>(categoryIcon.value);
    }
    if (categoryColor.present) {
      map['category_color'] = Variable<String>(categoryColor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('nominal: $nominal, ')
          ..write('categoryName: $categoryName, ')
          ..write('categoryIcon: $categoryIcon, ')
          ..write('categoryColor: $categoryColor')
          ..write(')'))
        .toString();
  }
}

abstract class _$TbExpense extends GeneratedDatabase {
  _$TbExpense(QueryExecutor e) : super(e);
  late final $ExpenseTable expense = $ExpenseTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [expense];
}
