import 'package:hive/hive.dart';
part 'reminder_model.g.dart';
@HiveType(typeId: 0)
class ReminderModel extends HiveObject{
  @HiveField(0)
   String title;
  @HiveField(1)
   String description;
  @HiveField(2)
   DateTime dateTime;
  @HiveField(3)
  final String id;
  @HiveField(4)
  bool isCompleted;

  ReminderModel({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.id,
    this.isCompleted = false,
  });
}
