import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
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
              'Privacy Policy',
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
              'Information We Collect',
              'We collect information that you provide directly to us, including but not limited to:\n\n'
                  '• Personal information (name, email address, phone number)\n'
                  '• Profile information\n'
                  '• Usage data and preferences\n'
                  '• Device information',
            ),
            _buildSection(
              context,
              'How We Use Your Information',
              'We use the information we collect to:\n\n'
                  '• Provide and maintain our services\n'
                  '• Improve and personalize your experience\n'
                  '• Communicate with you about updates and changes\n'
                  '• Ensure the security of our services',
            ),
            _buildSection(
              context,
              'Data Security',
              'We implement appropriate security measures to protect your personal information. However, no method of transmission over the internet is 100% secure.',
            ),
            _buildSection(
              context,
              'Your Rights',
              'You have the right to:\n\n'
                  '• Access your personal information\n'
                  '• Correct inaccurate data\n'
                  '• Request deletion of your data\n'
                  '• Object to data processing',
            ),
            _buildSection(
              context,
              'Contact Us',
              'If you have any questions about this Privacy Policy, please contact us at:\n\n'
                  'Email: privacy@example.com\n'
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
