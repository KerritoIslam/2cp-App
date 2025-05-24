import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CookiesPolicyPage extends StatelessWidget {
  const CookiesPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cookies Policy',
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
              'Cookies Policy',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Last updated: ${DateTime.now().toString().split(' ')[0]}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 30.h),
            _buildSection(
              context,
              'What Are Cookies',
              'Cookies are small text files that are placed on your device when you visit our application. They help us provide you with a better experience by enabling us to monitor which pages you find useful and which you do not.',
            ),
            _buildSection(
              context,
              'How We Use Cookies',
              'We use cookies for the following purposes:\n\n'
                  '• Essential cookies: Required for the application to function properly\n'
                  '• Performance cookies: Help us understand how visitors interact with our application\n'
                  '• Functionality cookies: Remember your preferences and settings\n'
                  '• Analytics cookies: Help us improve our application',
            ),
            _buildSection(
              context,
              'Types of Cookies We Use',
              '1. Session Cookies: Temporary cookies that expire when you close your browser\n'
                  '2. Persistent Cookies: Remain on your device for a set period of time\n'
                  '3. Third-party Cookies: Set by external services we use',
            ),
            _buildSection(
              context,
              'Managing Cookies',
              'You can control and/or delete cookies as you wish. You can delete all cookies that are already on your device and you can set most browsers to prevent them from being placed.',
            ),
            _buildSection(
              context,
              'Your Choices',
              'You can choose to:\n\n'
                  '• Accept all cookies\n'
                  '• Reject non-essential cookies\n'
                  '• Delete existing cookies\n'
                  '• Set your browser to notify you when you receive a cookie',
            ),
            _buildSection(
              context,
              'Contact Us',
              'If you have any questions about our Cookies Policy, please contact us at:\n\n'
                  'Email: cookies@example.com\n'
                  'Phone: +1 (555) 123-4567',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 10.h),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
