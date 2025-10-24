import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_footer.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

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
                vertical: isMobile ? 80 : 150,
              ),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 700),
                  padding: const EdgeInsets.all(60),
                  decoration: BoxDecoration(
                    color: AppColors.darkGrey,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColors.goldAccent.withOpacity(0.5)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.goldAccent.withOpacity(0.2),
                        blurRadius: 30,
                        offset: const Offset(0, 15),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FadeInDown(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.goldAccent.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check_circle,
                            color: AppColors.goldAccent,
                            size: 80,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      FadeInUp(
                        delay: const Duration(milliseconds: 200),
                        child: Text(
                          'Payment Successful!',
                          style: isMobile 
                              ? AppTextStyles.heading3
                              : AppTextStyles.heading2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeInUp(
                        delay: const Duration(milliseconds: 400),
                        child: Text(
                          'Thank you for choosing DESDICO',
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: AppColors.goldAccent,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 30),
                      FadeInUp(
                        delay: const Duration(milliseconds: 600),
                        child: Text(
                          'Your order has been confirmed and our team will reach out to you within 24 hours to begin your project.',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.offWhite.withOpacity(0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 50),
                      FadeInUp(
                        delay: const Duration(milliseconds: 800),
                        child: Column(
                          children: [
                            Text(
                              'Download Your Package',
                              style: AppTextStyles.heading4.copyWith(fontSize: 18),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton.icon(
                              onPressed: () {
                                _downloadPDF(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.goldAccent,
                                foregroundColor: AppColors.deepBlack,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 8,
                              ),
                              icon: const Icon(Icons.download, size: 24),
                              label: Text(
                                'Download Project Package (PDF)',
                                style: AppTextStyles.button.copyWith(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      Divider(color: AppColors.goldAccent.withOpacity(0.3)),
                      const SizedBox(height: 30),
                      FadeInUp(
                        delay: const Duration(milliseconds: 1000),
                        child: Column(
                          children: [
                            Text(
                              'What happens next?',
                              style: AppTextStyles.heading4.copyWith(fontSize: 18),
                            ),
                            const SizedBox(height: 25),
                            _buildNextStep('1', 'Email Confirmation', 'Check your inbox for order details'),
                            const SizedBox(height: 20),
                            _buildNextStep('2', 'Team Assignment', 'Your dedicated team will be assigned'),
                            const SizedBox(height: 20),
                            _buildNextStep('3', 'Kick-off Meeting', 'Schedule your first consultation'),
                            const SizedBox(height: 20),
                            _buildNextStep('4', 'Project Begins', 'We start bringing your vision to life'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pushNamed(context, '/'),
                            child: Text(
                              'Back to Home',
                              style: AppTextStyles.goldAccent,
                            ),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () => Navigator.pushNamed(context, '/contact'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: AppColors.goldAccent,
                              side: const BorderSide(color: AppColors.goldAccent, width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Contact Support',
                              style: AppTextStyles.button.copyWith(
                                color: AppColors.goldAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildNextStep(String number, String title, String description) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.goldAccent, width: 2),
          ),
          child: Center(
            child: Text(
              number,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.goldAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                description,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.offWhite.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _downloadPDF(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.darkGrey,
        content: Row(
          children: [
            const Icon(Icons.download_done, color: AppColors.goldAccent),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Project package download initiated!',
                style: AppTextStyles.bodyMedium,
              ),
            ),
          ],
        ),
        action: SnackBarAction(
          label: 'OK',
          textColor: AppColors.goldAccent,
          onPressed: () {},
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
