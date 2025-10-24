import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class FloatingChatButton extends StatelessWidget {
  const FloatingChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        _showChatDialog(context);
      },
      backgroundColor: AppColors.goldAccent,
      icon: const Icon(Icons.chat_bubble_outline, color: AppColors.deepBlack),
      label: Text(
        'Chat with AI',
        style: AppTextStyles.button,
      ),
    );
  }

  void _showChatDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.darkGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.goldAccent.withOpacity(0.3)),
        ),
        title: Row(
          children: [
            const Icon(Icons.smart_toy, color: AppColors.goldAccent),
            const SizedBox(width: 12),
            Text('AI Assistant', style: AppTextStyles.heading4),
          ],
        ),
        content: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Our AI assistant is currently being developed and will be available soon to help you with:',
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: 20),
              _buildFeatureItem('Project inquiries & quotes'),
              _buildFeatureItem('Design consultations'),
              _buildFeatureItem('Portfolio exploration'),
              _buildFeatureItem('Booking appointments'),
              const SizedBox(height: 20),
              Text(
                'For immediate assistance, please contact us directly.',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.goldAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: AppTextStyles.goldAccent,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/contact');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.goldAccent,
              foregroundColor: AppColors.deepBlack,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('Contact Us', style: AppTextStyles.button),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: AppColors.goldAccent, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
