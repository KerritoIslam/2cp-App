import 'package:app/features/authentication/application/bloc/auth_bloc.dart';
import 'package:app/features/authentication/application/bloc/auth_events.dart';
import 'package:app/features/authentication/application/bloc/auth_state.dart';
import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class EducationForm extends StatefulWidget {
  final int? index;
  const EducationForm({super.key, this.index});

  @override
  _EducationFormState createState() => _EducationFormState();
}

late TextEditingController _educationController;
late TextEditingController _schoolNameController;
String? _startDate;
String? _endDate;
late User user;

class _EducationFormState extends State<EducationForm> {
  @override
  void initState() {
    final state = context.read<AuthBloc>().state;
    if (state is Authenticated) {
      user = state.user;
    } else {
      context.read<AuthBloc>().add(AuthLogoutRequested());
      return;
    }

    _educationController = TextEditingController(
        text: widget.index != null
            ? user.education[widget.index!]['education']
            : '');
    _schoolNameController = TextEditingController(
        text: widget.index != null
            ? user.education[widget.index!]['school']
            : '');
    _startDate = widget.index != null
        ? user.education[widget.index!]['start_date']
        : null;
    _endDate =
        widget.index != null ? user.education[widget.index!]['end_date'] : null;

    super.initState();
  }

  @override
  void dispose() {
    _schoolNameController.dispose();
    _educationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Add education',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              TextField(
                controller: _educationController,
                cursorColor: Color(0xFF5BA470),
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  labelText: 'Education Status',
                  labelStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Color(0xFF5BA470),
                      ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF5BA470)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  controller: _schoolNameController,
                  cursorColor: Color(0xFF5BA470),
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    labelText: 'School',
                    labelStyle:
                        Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Color(0xFF5BA470),
                            ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF5BA470)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 160.0,
                    child: TextButton(
                        onPressed: () async {
                          final result = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                          );
                          if (result != null) {
                            setState(() {
                              _startDate =
                                  "${result.day}/${result.month}/${result.year}";
                            });
                          }
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Start date',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      color: Color(0xFF5BA470),
                                    ),
                              ),
                              Text(_startDate ?? 'Select date',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 160.0,
                    child: TextButton(
                        onPressed: () async {
                          final result = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                          );
                          if (result != null) {
                            try {
                              final startDate =
                                  DateFormat('dd/MM/yyyy').parse(_startDate!);
                              if (result.isAfter(startDate)) {
                                setState(() {
                                  _endDate =
                                      "${result.day}/${result.month}/${result.year}";
                                });
                              }
                            } catch (e) {
                              // Handle the exception, e.g., show an error message
                              print('Invalid start date format: $e');
                            }
                          }
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'End date',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      color: Color(0xFF5BA470),
                                    ),
                              ),
                              Text(_endDate ?? 'Select date',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 100.h),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    List<Map<String, dynamic>> education =
                        List.from(user.education);

                    if (widget.index != null) {
                      education[widget.index!] = {
                        'education': _educationController.text,
                        'school': _schoolNameController.text,
                        'start_date': _startDate,
                        'end_date': _endDate,
                      };
                    } else {
                      education.add({
                        'education': _educationController.text,
                        'school': _schoolNameController.text,
                        'start_date': _startDate,
                        'end_date': _endDate,
                      });
                      
                    }
                    
                    context.read<AuthBloc>().add(
                          AuthUserUpdated(user.copyWith(education: education)));
                          context.go('/profile');
                        
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Color(0xFF5BA470)),
                    padding: WidgetStateProperty.all(
                      EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Save',
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
