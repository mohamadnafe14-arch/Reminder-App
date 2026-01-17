import 'package:hive_flutter/hive_flutter.dart';
import 'package:reminder_app/features/reminder/data/models/reminder_model.dart';
import 'package:reminder_app/features/reminder/data/repo/reminder_repo.dart';

class ReminderRepoImpl implements ReminderRepo {
  final Box<ReminderModel> reminderBox;

  ReminderRepoImpl({required this.reminderBox});
  @override
  Future<void> addReminder(ReminderModel reminder) async {
    await reminderBox.add(reminder);
  }

  @override
  Future<void> deleteReminder(ReminderModel reminder) async {
    reminder.delete();
  }

  @override
  Future<List<ReminderModel>> getAllReminders() async {
    return reminderBox.values.toList();
  }

  @override
  Future<void> updateReminder(
    ReminderModel reminder, {
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? dateTime,
  }) async {
    reminder.title = title ?? reminder.title;
    reminder.description = description ?? reminder.description;
    reminder.isCompleted = isCompleted ?? reminder.isCompleted;
    reminder.dateTime = dateTime ?? reminder.dateTime;
    await reminder.save();
  }

  @override
  Future<void> toggleReminder(ReminderModel reminderModel) async {
    reminderModel.isCompleted = !reminderModel.isCompleted;
    await reminderModel.save();
  }
}
