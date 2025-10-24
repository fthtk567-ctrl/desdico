import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.deepBlack.withOpacity(0.95),
        boxShadow: [
          BoxShadow(
            color: AppColors.goldAccent.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/'),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/desdico-logo.png',
                    height: isMobile ? 40 : 50,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Row(
                        children: [
                          Icon(
                            Icons.architecture,
                            color: AppColors.goldAccent,
                            size: isMobile ? 28 : 36,
                          ),
                          const SizedBox(width: 12),
                          if (!isMobile)
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
                ],
              ),
            ),

            // Navigation
            if (isMobile)
              IconButton(
                icon: const Icon(Icons.menu, color: AppColors.goldAccent),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: AppColors.darkGrey,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => _buildMobileMenu(context),
                  );
                },
              )
            else
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildNavItem(context, 'Home', '/'),
                    const SizedBox(width: 20),
                    _buildNavItem(context, 'About', '/about'),
                    const SizedBox(width: 20),
                    _buildNavItem(context, 'Products', '/products'),
                    const SizedBox(width: 20),
                    _buildNavItem(context, 'Services', '/services'),
                    const SizedBox(width: 20),
                    _buildNavItem(context, 'Pricing', '/pricing'),
                    const SizedBox(width: 20),
                    _buildNavItem(context, 'Contact', '/contact'),
                    const SizedBox(width: 20),
                    _buildCTAButton(context),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, String route) {
    final isActive = ModalRoute.of(context)?.settings.name == route;

    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.bodyMedium.copyWith(
              color: isActive ? AppColors.goldAccent : AppColors.offWhite,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.goldAccent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCTAButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, '/contact'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.goldAccent,
        foregroundColor: AppColors.deepBlack,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
      ),
      child: Text('Book Consultation', style: AppTextStyles.button),
    );
  }

  Widget _buildMobileMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildMobileMenuItem(context, 'Home', '/'),
          _buildMobileMenuItem(context, 'About', '/about'),
          _buildMobileMenuItem(context, 'Products', '/products'),
          _buildMobileMenuItem(context, 'Services', '/services'),
          _buildMobileMenuItem(context, 'Pricing', '/pricing'),
          _buildMobileMenuItem(context, 'Contact', '/contact'),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: _buildCTAButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileMenuItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles.bodyLarge,
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.goldAccent, size: 16),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
