class Task {
  static const String FIELD_ID = '_id';
  static const String FIELD_NAME = 'name';
  static const String FIELD_CREATED_DATE = 'createdDate';

  final String id;
  final String name;
  final String createdDate;

  Task({this.name, this.id, this.createdDate});

  Task.fromJson(Map<String, dynamic> json)
      : id = json[FIELD_ID],
        name = json[FIELD_NAME],
        createdDate = json[FIELD_CREATED_DATE];

  Map<String, dynamic> toJson() => {
        FIELD_ID: id,
        FIELD_NAME: name,
        FIELD_CREATED_DATE: createdDate,
      };
}
