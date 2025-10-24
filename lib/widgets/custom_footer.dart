import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        border: Border(
          top: BorderSide(color: AppColors.goldAccent.withOpacity(0.3), width: 1),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 40 : 80),
        child: isMobile ? _buildMobileFooter(context) : _buildDesktopFooter(context),
      ),
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: _buildCompanyInfo(),
            ),
            Expanded(
              child: _buildQuickLinks(context),
            ),
            Expanded(
              child: _buildServices(context),
            ),
            Expanded(
              child: _buildContact(),
            ),
          ],
        ),
        const SizedBox(height: 60),
        Divider(color: AppColors.goldAccent.withOpacity(0.2)),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '© 2025 Dilek Leyla LLC. | desdico.com | All rights reserved.',
              style: AppTextStyles.bodySmall,
            ),
            _buildSocialIcons(),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCompanyInfo(),
        const SizedBox(height: 40),
        _buildQuickLinks(context),
        const SizedBox(height: 40),
        _buildServices(context),
        const SizedBox(height: 40),
        _buildContact(),
        const SizedBox(height: 40),
        _buildSocialIcons(),
        const SizedBox(height: 30),
        Divider(color: AppColors.goldAccent.withOpacity(0.2)),
        const SizedBox(height: 20),
        Text(
          '© 2025 Dilek Leyla LLC.\ndesdico.com\nAll rights reserved.',
          style: AppTextStyles.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCompanyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/desdico-logo.png',
          height: 60,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Row(
              children: [
                const Icon(Icons.architecture, color: AppColors.goldAccent, size: 32),
                const SizedBox(width: 12),
                Text(
                  'DESDICO',
                  style: AppTextStyles.heading4.copyWith(
                    color: AppColors.goldAccent,
                    letterSpacing: 2,
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 20),
        Text(
          'Elite Architecture & Consultancy\nGlobal Premium Design Studio',
          style: AppTextStyles.bodySmall,
        ),
        const SizedBox(height: 20),
        Text(
          'Registered in Albuquerque, NM, USA\ninfo@desdico.com',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.goldAccent.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickLinks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick Links', style: AppTextStyles.heading4.copyWith(fontSize: 18)),
        const SizedBox(height: 20),
        _buildFooterLink(context, 'Home', '/'),
        _buildFooterLink(context, 'About Us', '/about'),
        _buildFooterLink(context, 'Products', '/products'),
        _buildFooterLink(context, 'Services', '/services'),
        _buildFooterLink(context, 'Pricing', '/pricing'),
        _buildFooterLink(context, 'Contact', '/contact'),
      ],
    );
  }

  Widget _buildServices(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Our Services', style: AppTextStyles.heading4.copyWith(fontSize: 18)),
        const SizedBox(height: 20),
        _buildFooterLink(context, 'Architectural Design', '/services'),
        _buildFooterLink(context, 'Project Consultation', '/services'),
        _buildFooterLink(context, '3D Visualization', '/services'),
        _buildFooterLink(context, 'Structural Planning', '/services'),
      ],
    );
  }

  Widget _buildContact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact Us', style: AppTextStyles.heading4.copyWith(fontSize: 18)),
        const SizedBox(height: 20),
        _buildContactItem(Icons.email, 'info@desdico.com'),
        _buildContactItem(Icons.phone, '+1 505 207 2084'),
        _buildContactItem(Icons.location_on, 'Albuquerque, NM, USA'),
      ],
    );
  }

  Widget _buildFooterLink(BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(
          title,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.offWhite.withOpacity(0.7),
          ),
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: AppColors.goldAccent, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSocialIcon(FontAwesomeIcons.linkedin, 'https://linkedin.com'),
        const SizedBox(width: 20),
        _buildSocialIcon(FontAwesomeIcons.instagram, 'https://instagram.com'),
        const SizedBox(width: 20),
        _buildSocialIcon(FontAwesomeIcons.twitter, 'https://twitter.com'),
        const SizedBox(width: 20),
        _buildSocialIcon(FontAwesomeIcons.facebook, 'https://facebook.com'),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: FaIcon(
          icon,
          color: AppColors.goldAccent,
          size: 18,
        ),
      ),
    );
  }
}
