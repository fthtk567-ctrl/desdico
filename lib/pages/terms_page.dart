import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_footer.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

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
                      'Terms of Service',
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
                    '1. Agreement to Terms',
                    'By accessing and using DESDICO services (desdico.com), you accept and agree to be bound by the terms and provision of this agreement. Dilek Leyla LLC. is a company registered in Albuquerque, New Mexico, USA.',
                  ),
                  _buildSection(
                    '2. Services',
                    'DESDICO provides premium architectural design, project consultation, and visualization services. All deliverables include PDF documentation, 3D models, and consultation support as specified in your selected package.',
                  ),
                  _buildSection(
                    '3. Payment Terms',
                    'Payment is required in full before project commencement unless otherwise agreed in writing. We accept payments via Stripe, including major credit cards and bank transfers. All prices are in USD and exclude applicable taxes.',
                  ),
                  _buildSection(
                    '4. Intellectual Property',
                    'Upon full payment, you receive full ownership rights to all deliverables. DESDICO retains the right to showcase completed projects in our portfolio unless otherwise agreed.',
                  ),
                  _buildSection(
                    '5. Revisions & Updates',
                    'All packages include lifetime access to updates and revisions as specified. Additional revisions beyond the agreed scope may incur additional fees.',
                  ),
                  _buildSection(
                    '6. Confidentiality',
                    'We maintain strict confidentiality of all project information and will not disclose details without your explicit consent.',
                  ),
                  _buildSection(
                    '7. Limitation of Liability',
                    'DESDICO shall not be liable for any indirect, incidental, special, consequential, or punitive damages resulting from your use of our services.',
                  ),
                  _buildSection(
                    '8. Termination',
                    'Either party may terminate this agreement with 30 days written notice. Refunds for terminated projects will be calculated based on work completed.',
                  ),
                  _buildSection(
                    '9. Contact Information',
                    'For questions about these Terms, please contact us at:\ninfo@desdico.com\nDilek Leyla LLC.\n1209 Mountain Road PL STE,N\nAlbuquerque, NM 87110 USA',
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
