import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class IntershipExpirienceForm extends StatefulWidget {
  const IntershipExpirienceForm({super.key});

  @override
  _IntershipExpirienceFormState createState() =>
      _IntershipExpirienceFormState();
}

class _IntershipExpirienceFormState extends State<IntershipExpirienceForm> {
  final TextEditingController _internshipController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _startDate;
  String? _endDate;
  bool _currentPosition = false;
  @override
  void dispose() {
    _companyNameController.dispose();
    _internshipController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  'Add Internship experience',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              TextField(
                controller: _internshipController,
                cursorColor: Color(0xFF5BA470),
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  labelText: 'Internship title',
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
                  controller: _companyNameController,
                  cursorColor: Color(0xFF5BA470),
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    labelText: 'Company',
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
                          if (result != null &&
                              result.isAfter(DateFormat('dd/MM/yyyy')
                                  .parse(_startDate!))) {
                            setState(() {
                              _endDate =
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
              Row(
                children: [
                  Checkbox(
                      value: _currentPosition,
                      side: BorderSide(color: Color(0xFF5BA470), width: 0.5),
                      fillColor: WidgetStateProperty.resolveWith((states) =>
                          _currentPosition
                              ? Color(0xFF5BA470)
                              : Colors.transparent),
                      onChanged: (value) {
                        setState(() {
                          _currentPosition = value!;
                        });
                      }),
                  Text(
                    'This is my position now',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Color(0xFF5BA470), fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Text(
                'Discription',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Color(0xFF5BA470),
                    ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: _descriptionController,
                  cursorColor: Color(0xFF5BA470),
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintText: 'Write additional information here',
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF5BA470)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 7,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    //todo: edit the return value
                    context.pop(_companyNameController.text);
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
