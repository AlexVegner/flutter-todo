import 'package:todo/utils/string_utils.dart';

mixin ModelContract {

  /// Use plural
  String get name => '';
  String get tableName => capitalizeFirst(name);
  String get url => "/api";
}