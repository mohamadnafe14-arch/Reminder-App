import 'package:reminder_app/features/reminder/data/models/reminder_model.dart';

abstract class ReminderRepo {
  Future<List<ReminderModel>> getAllReminders();
  Future<void> addReminder(ReminderModel reminder);
  Future<void> updateReminder(
    ReminderModel reminder, {
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? dateTime,
  });
  Future<void> deleteReminder(ReminderModel reminder);
  Future<void> toggleReminder(ReminderModel reminder);
}
