import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_footer.dart';

class RefundPage extends StatelessWidget {
  const RefundPage({super.key});

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
                      'Refund & Cancellation Policy',
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
                    '1. Refund Policy',
                    'We stand behind the quality of our work. If you\'re not satisfied with our services, you may request a refund within specific timeframes based on project stage and work completed.',
                  ),
                  _buildSection(
                    '2. Eligibility for Refunds',
                    'Full refunds are available within 14 days of purchase if no significant work has commenced. Partial refunds are calculated based on work completed and milestones reached. No refunds after final delivery acceptance.',
                  ),
                  _buildSection(
                    '3. Refund Process',
                    'To request a refund, email info@desdico.com with your project details and reason for refund. Requests are reviewed within 5 business days. Approved refunds are processed within 10 business days to the original payment method.',
                  ),
                  _buildSection(
                    '4. Cancellation Policy',
                    'You may cancel your project at any time with written notice. Cancellation fees apply based on project stage: 0-25% complete: 25% of total, 26-50% complete: 50% of total, 51-75% complete: 75% of total, 76%+ complete: 100% of total (no refund).',
                  ),
                  _buildSection(
                    '5. Non-Refundable Items',
                    'Third-party fees (permits, licenses), rush delivery fees, and completed consultation sessions are non-refundable. Custom 3D modeling work that has been delivered is non-refundable.',
                  ),
                  _buildSection(
                    '6. Force Majeure',
                    'DESDICO is not liable for delays or inability to perform due to circumstances beyond our control. Projects may be paused without penalty during force majeure events.',
                  ),
                  _buildSection(
                    '7. Dispute Resolution',
                    'We encourage resolving issues through direct communication. If a dispute arises, both parties agree to attempt mediation before pursuing legal action. UK law governs all disputes.',
                  ),
                  _buildSection(
                    '8. Modifications to Policy',
                    'DESDICO reserves the right to modify this policy at any time. Changes become effective immediately upon posting. Continued use of services constitutes acceptance of updated terms.',
                  ),
                  _buildSection(
                    '9. Contact Information',
                    'For refund or cancellation requests:\ninfo@desdico.com\nDilek Leyla LLC.\n1209 Mountain Road PL STE,N\nAlbuquerque, NM 87110 USA\n+1 505 207 2084',
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
