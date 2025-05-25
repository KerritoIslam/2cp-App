import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
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
              'Get in Touch',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 20.h),
            _buildContactInfo(context),
            SizedBox(height: 30.h),
            _buildContactForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoItem(
          context,
          Icons.location_on,
          'Address',
          '123 Business Street\nCity, State 12345',
        ),
        SizedBox(height: 20.h),
        _buildInfoItem(
          context,
          Icons.phone,
          'Phone',
          '+1 (555) 123-4567',
        ),
        SizedBox(height: 20.h),
        _buildInfoItem(
          context,
          Icons.email,
          'Email',
          'growpath@gmail.com',
        ),
      ],
    );
  }

  Widget _buildInfoItem(
      BuildContext context, IconData icon, String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
          size: 24.r,
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 5.h),
              Text(
                content,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send us a Message',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 20.h),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Your Name',
              labelStyle:
                  TextStyle(color: Theme.of(context).secondaryHeaderColor),
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          SizedBox(height: 15.h),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Your Email',
              labelStyle:
                  TextStyle(color: Theme.of(context).secondaryHeaderColor),
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 15.h),
          TextFormField(
            controller: _messageController,
            decoration: InputDecoration(
              labelText: 'Your Message',
              labelStyle:
                  TextStyle(color: Theme.of(context).secondaryHeaderColor),
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
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            child: FButton(
              label: Text(
                'Send Message',
                style: TextStyle(fontSize: 16.sp, color: Colors.white),
              ),
              onPress: () {
                if (_formKey.currentState!.validate()) {
                  // TODO: Implement form submission
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Message sent successfully!'),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  );
                  _nameController.clear();
                  _emailController.clear();
                  _messageController.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
