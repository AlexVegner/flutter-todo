import 'package:todo/data/conf.dart';
import 'package:todo/utils/string_utils.dart';
import 'package:todo/data/redux/model_contract.dart';


mixin TaskContract implements ModelContract {
  
  @override
  String get name => "tasks";

  @override
  String get tableName => capitalizeFirst(name);

  @override
  String get url => "$BASE_URI/v1/tasks";
}
 