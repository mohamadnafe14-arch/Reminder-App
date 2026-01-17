import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder_app/features/reminder/data/models/reminder_model.dart';
import 'package:reminder_app/features/reminder/presentation/cubit/reminder_cubit/reminder_cubit.dart';
import 'package:reminder_app/features/reminder/presentation/views/widgets/custom_button.dart';
import 'package:reminder_app/features/reminder/presentation/views/widgets/custom_text_form_field.dart';

class UpdateViewBody extends StatefulWidget {
  const UpdateViewBody({super.key, required this.reminderModel});
  final ReminderModel reminderModel;
  @override
  State<UpdateViewBody> createState() => _UpdateViewBodyState();
}

class _UpdateViewBodyState extends State<UpdateViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? title, description;
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Update Reminder",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Title",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hintText: widget.reminderModel.title,
                onSaved: (value) => title = value,
                onChanged: (value) => title = value,
                prefixIcon: Icons.title,
              ),
              const SizedBox(height: 16),
              Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hintText: widget.reminderModel.description,
                onSaved: (value) => description = value,
                onChanged: (value) => description = value,
                prefixIcon: Icons.description,
                maxLines: 4,
              ),
              const SizedBox(height: 16),
              Text(
                "Date & Time",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Builder(
                builder: (context) {
                  return CustomButton(
                    text: "choose date",
                    onPressed: () async {
                      final pickedTime = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (pickedTime != null) {
                        setState(() {
                          dateTime = pickedTime;
                        });
                      }
                    },
                    loading: false,
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<ReminderCubit, ReminderState>(
                builder: (context, state) {
                  return CustomButton(
                    text: "Update",
                    onPressed: () {
                      BlocProvider.of<ReminderCubit>(context).updateReminder(
                        widget.reminderModel,
                        title: title,
                        description: description,
                        isCompleted: widget.reminderModel.isCompleted,
                        dateTime: dateTime,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Reminder updated successfully!"),
                        ),
                      );
                      GoRouter.of(context).pop();
                    },
                    loading: state is ReminderLoading,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
