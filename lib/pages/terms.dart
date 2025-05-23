import 'package:flutter/material.dart';
import 'package:relief_fund/widgets/colors.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.backgroundColor,
      alignment: Alignment.center,
      shadowColor: Colors.black,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms & Conditions',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSection(
                      '1. Acceptance of Terms',
                      'By using Relief Fund, you agree to these terms and conditions.',
                    ),
                    _buildSection(
                      '2. User Responsibilities',
                      'You must provide accurate information and use the app responsibly.',
                    ),
                    _buildSection(
                      '3. Privacy Policy',
                      'Your data will be handled according to our Privacy Policy.',
                    ),
                    _buildSection(
                      '4. Prohibited Activities',
                      'You may not use this app for illegal purposes or harassment.',
                    ),
                    _buildSection(
                      '5. Modifications',
                      'We reserve the right to modify these terms at any time.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'I Understand',
                  style: TextStyle(
                    color: AppColors.backgroundColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(content),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
