import 'package:chefpartner_mobile/src/models/generic_model/query_options.dart';

abstract class ModelInterface {
  String getTableName();
  String getCreateTableScript();
  String getInsertScript(List<String> attributes);
  String getSelectScript({QueryOptions? queryOptions});
  String getUpdateScript(List<String> attributes);
  String getSoftDeleteScript();
}
