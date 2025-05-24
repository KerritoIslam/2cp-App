import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  final _feedbackController = TextEditingController();
  String _selectedCategory = 'General';

  final List<String> _categories = [
    'General',
    'Bug Report',
    'Feature Request',
    'User Experience',
    'Other'
  ];

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).secondaryHeaderColor),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 90.h,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We Value Your Feedback',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Help us improve by sharing your thoughts and suggestions',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
            ),
            SizedBox(height: 30.h),
            _buildFeedbackForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Category',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(8.r),
              color: Theme.of(context).primaryColor.withOpacity(0.1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedCategory,
                isExpanded: true,
                dropdownColor: Theme.of(context).primaryColor.withOpacity(0.1),
                style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 16.sp,
                ),
                items: _categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Your Feedback',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 10.h),
          TextFormField(
            controller: _feedbackController,
            decoration: InputDecoration(
              hintText: 'Please describe your feedback in detail...',
              hintStyle: TextStyle(
                  color:
                      Theme.of(context).secondaryHeaderColor.withOpacity(0.6)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              filled: true,
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            ),
            style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
            maxLines: 8,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your feedback';
              }
              if (value.length < 10) {
                return 'Please provide more detailed feedback';
              }
              return null;
            },
          ),
          SizedBox(height: 30.h),
          SizedBox(
            width: double.infinity,
            child: FButton(
              label: Text(
                'Submit Feedback',
                style: TextStyle(fontSize: 16.sp, color: Colors.white),
              ),
              onPress: () {
                if (_formKey.currentState!.validate()) {
                  // TODO: Implement feedback submission
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Thank you for your feedback!'),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  );
                  _feedbackController.clear();
                  setState(() {
                    _selectedCategory = 'General';
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
