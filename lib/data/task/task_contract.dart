import 'package:todo/data/redux/model_contract.dart';
import 'package:todo/utils/string_utils.dart';

mixin TaskContract {
  String get name => "tasks";
  String get tableName => capitalizeFirst(name);
  String get api => "/$name";
}
