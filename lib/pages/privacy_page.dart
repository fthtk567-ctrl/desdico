import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_footer.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      backgroundColor: AppColors.deepBlack,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 80,
                vertical: isMobile ? 60 : 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Privacy Policy',
                      style: isMobile 
                          ? AppTextStyles.heading3
                          : AppTextStyles.heading2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Last updated: October 24, 2025',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.goldAccent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  _buildSection(
                    '1. Information We Collect',
                    'We collect information you provide directly to us, including name, email address, phone number, project details, and payment information. We also automatically collect device information, IP addresses, and usage data.',
                  ),
                  _buildSection(
                    '2. How We Use Your Information',
                    'Your information is used to provide and improve our services, process transactions, send project updates, respond to inquiries, and comply with legal obligations. We never sell your personal information.',
                  ),
                  _buildSection(
                    '3. Data Storage & Security',
                    'We implement industry-standard security measures to protect your data. All payment information is processed securely through Stripe. Data is stored on secure servers with encryption.',
                  ),
                  _buildSection(
                    '4. Cookies & Tracking',
                    'We use cookies and similar tracking technologies to improve user experience, analyze website traffic, and remember your preferences. You can control cookie settings in your browser.',
                  ),
                  _buildSection(
                    '5. Third-Party Services',
                    'We work with trusted third-party service providers including Stripe for payments, Google Analytics for website analytics, and cloud hosting providers. These parties are bound by confidentiality agreements.',
                  ),
                  _buildSection(
                    '6. Your Rights',
                    'You have the right to access, update, or delete your personal information. You can opt-out of marketing communications at any time. For GDPR compliance, EU residents have additional rights including data portability.',
                  ),
                  _buildSection(
                    '7. Data Retention',
                    'We retain your information for as long as necessary to provide services and comply with legal obligations. Project files are retained for 7 years after project completion.',
                  ),
                  _buildSection(
                    '8. Children\'s Privacy',
                    'Our services are not directed to individuals under 18 years of age. We do not knowingly collect personal information from children.',
                  ),
                  _buildSection(
                    '9. International Transfers',
                    'Your information may be transferred to and processed in countries other than your own. We ensure appropriate safeguards are in place for international data transfers.',
                  ),
                  _buildSection(
                    '10. Contact Us',
                    'For privacy-related questions or to exercise your rights, contact us at:\ninfo@desdico.com\nDilek Leyla LLC.\n1209 Mountain Road PL STE,N\nAlbuquerque, NM 87110 USA',
                  ),
                ],
              ),
            ),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.heading4.copyWith(
              color: AppColors.goldAccent,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            content,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.offWhite.withOpacity(0.8),
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}
