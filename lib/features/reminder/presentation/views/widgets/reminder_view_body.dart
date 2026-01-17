
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/features/reminder/presentation/cubit/reminder_cubit/reminder_cubit.dart';
import 'package:reminder_app/features/reminder/presentation/views/widgets/custom_reminder_list_view.dart';
import 'package:reminder_app/features/reminder/presentation/views/widgets/reminder_view_failure_body.dart';
import 'package:reminder_app/features/reminder/presentation/views/widgets/reminder_view_initial_body.dart';
import 'package:reminder_app/features/reminder/presentation/views/widgets/reminder_view_loading_body.dart';

class ReminderViewBody extends StatelessWidget {
  const ReminderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReminderCubit, ReminderState>(
      builder: (BuildContext context, ReminderState state) {
        if (state is ReminderLoading) {
          return const ReminderViewLoadingBody();
        } else if (state is ReminderLoaded) {
          return CustomReminderListView(reminders: state.reminders);
        } else if (state is ReminderError) {
          return ReminderViewFailureBody(errorMessage: state.message);
        } else {
          return const ReminderViewInitialBody();
        }
      },
    );
  }
}
