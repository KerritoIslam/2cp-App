import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms and Conditions',
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
              'Terms and Conditions',
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
              '1. Acceptance of Terms',
              'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement.',
            ),
            _buildSection(
              context,
              '2. Use License',
              'Permission is granted to temporarily download one copy of the application per device for personal, non-commercial transitory viewing only.',
            ),
            _buildSection(
              context,
              '3. User Account',
              'To use certain features of the application, you must register for an account. You agree to provide accurate and complete information when creating your account.',
            ),
            _buildSection(
              context,
              '4. User Conduct',
              'You agree not to:\n\n'
                  '• Use the application for any illegal purpose\n'
                  '• Violate any laws in your jurisdiction\n'
                  '• Infringe upon the rights of others\n'
                  '• Interfere with the proper working of the application',
            ),
            _buildSection(
              context,
              '5. Intellectual Property',
              'The application and its original content, features, and functionality are owned by us and are protected by international copyright, trademark, and other intellectual property laws.',
            ),
            _buildSection(
              context,
              '6. Termination',
              'We may terminate or suspend your account and bar access to the application immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever.',
            ),
            _buildSection(
              context,
              '7. Changes to Terms',
              'We reserve the right to modify or replace these Terms at any time. If a revision is material, we will provide at least 30 days notice prior to any new terms taking effect.',
            ),
            _buildSection(
              context,
              '8. Contact Us',
              'If you have any questions about these Terms, please contact us at:\n\n'
                  'Email: terms@example.com\n'
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
