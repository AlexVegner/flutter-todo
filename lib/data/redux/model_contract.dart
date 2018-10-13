import 'package:todo/utils/string_utils.dart';

abstract class ModelContract {

  /// Use plural
  String get name;
  String get tableName => capitalizeFirst(name);
  String get api => "/$name";
}