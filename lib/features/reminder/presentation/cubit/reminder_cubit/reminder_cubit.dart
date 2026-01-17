// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reminder_app/features/reminder/data/models/reminder_model.dart';
import 'package:reminder_app/features/reminder/data/repo/reminder_repo.dart';

part 'reminder_state.dart';

class ReminderCubit extends Cubit<ReminderState> {
  ReminderCubit(this.reminderRepo) : super(ReminderInitial());
  final ReminderRepo reminderRepo;
  Future<void> addReminder(ReminderModel reminder) async {
    emit(ReminderLoading());
    try {
      await reminderRepo.addReminder(reminder);
      emit(ReminderLoaded(await reminderRepo.getAllReminders()));
    } catch (e) {
      emit(ReminderError(e.toString()));
    }
  }

  Future<void> updateReminder(
    ReminderModel reminder, {
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? dateTime,
  }) async {
    emit(ReminderLoading());
    try {
      await reminderRepo.updateReminder(
        reminder,
        title: title,
        description: description,
        isCompleted: isCompleted,
        dateTime: dateTime,
      );
      emit(ReminderLoaded(await reminderRepo.getAllReminders()));
    } catch (e) {
      emit(ReminderError(e.toString()));
    }
  }

  Future<void> deleteReminder(ReminderModel reminderModel) async {
    emit(ReminderLoading());
    try {
      await reminderRepo.deleteReminder(reminderModel);
    } catch (e) {
      emit(ReminderError(e.toString()));
    }
  }

  Future<void> toggleReminder(ReminderModel reminderModel) async {
    emit(ReminderLoading());
    try {
      await reminderRepo.toggleReminder(reminderModel);
      emit(ReminderLoaded(await reminderRepo.getAllReminders()));
    } catch (e) {
      emit(ReminderError(e.toString()));
    }
  }

  Future<void> getAllReminders() async {
    emit(ReminderLoading());
    try {
      emit(ReminderLoaded(await reminderRepo.getAllReminders()));
    } catch (e) {
      emit(ReminderError(e.toString()));
    }
  }
}
