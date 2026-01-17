import 'package:flutter/material.dart';
import 'package:reminder_app/features/reminder/data/models/reminder_model.dart';
import 'package:reminder_app/features/reminder/presentation/views/widgets/update_view_body.dart';

class UpdateView extends StatelessWidget {
  const UpdateView({super.key, required this.reminder});
  final ReminderModel reminder;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: UpdateViewBody(reminderModel: reminder)),
    );
  }
}
