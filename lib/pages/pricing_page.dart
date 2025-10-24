import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_footer.dart';
import '../widgets/scroll_to_top_button.dart';
import '../widgets/floating_chat_button.dart';

class PricingPage extends StatefulWidget {
  const PricingPage({super.key});

  @override
  State<PricingPage> createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepBlack,
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                _buildHeroSection(context),
                _buildPricingTable(context),
                _buildGuaranteeSection(context),
                _buildFAQSection(context),
                const CustomFooter(),
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: ScrollToTopButton(scrollController: _scrollController),
          ),
          const Positioned(
            right: 20,
            bottom: 100,
            child: FloatingChatButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      height: isMobile ? 400 : 500,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.darkGrey,
            AppColors.deepBlack,
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInDown(
                child: Text(
                  'Transparent Pricing',
                  style: isMobile 
                      ? AppTextStyles.heading2.copyWith(fontSize: 36)
                      : AppTextStyles.heading1.copyWith(fontSize: 56),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                child: Text(
                  'Investment in excellence, delivered with precision',
                  style: isMobile 
                      ? AppTextStyles.bodyLarge
                      : AppTextStyles.bodyLarge.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPricingTable(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 120,
      ),
      child: Column(
        children: [
          FadeInUp(
            child: Text(
              'Choose Your Package',
              style: isMobile ? AppTextStyles.heading3 : AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          isMobile 
              ? _buildMobilePricingCards()
              : _buildDesktopPricingTable(),
        ],
      ),
    );
  }

  Widget _buildMobilePricingCards() {
    return Column(
      children: [
        _buildPricingCard(
          'Structural Visualization',
          '\$200,000',
          [
            'Photorealistic 3D renders',
            'Virtual walkthrough videos',
            'Structural analysis reports',
            'Engineering documentation',
            'Multiple revision rounds',
          ],
          false,
        ),
        const SizedBox(height: 30),
        _buildPricingCard(
          'Elite Architectural Design',
          '\$300,000',
          [
            'Complete architectural blueprints',
            'High-resolution 3D modeling',
            'Material specifications',
            'Structural documentation',
            'Lifetime updates & revisions',
          ],
          true,
        ),
        const SizedBox(height: 30),
        _buildPricingCard(
          'Premium Project Consultation',
          '\$500,000',
          [
            'Dedicated project manager',
            'Expert architectural advisors',
            '24/7 consultation support',
            'On-site visits included',
            'Progress monitoring & reporting',
          ],
          false,
        ),
      ],
    );
  }

  Widget _buildPricingCard(String title, String price, List<String> features, bool isFeatured) {
    return FadeInUp(
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: isFeatured ? AppColors.darkGrey : AppColors.mediumGrey,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isFeatured 
                ? AppColors.goldAccent 
                : AppColors.goldAccent.withOpacity(0.3),
            width: isFeatured ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isFeatured
                  ? AppColors.goldAccent.withOpacity(0.3)
                  : AppColors.goldAccent.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            if (isFeatured)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: AppColors.goldAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'MOST POPULAR',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.deepBlack,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            Text(
              title,
              style: AppTextStyles.heading4,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              price,
              style: AppTextStyles.heading2.copyWith(
                color: AppColors.goldAccent,
              ),
            ),
            const SizedBox(height: 30),
            ...features.map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: AppColors.goldAccent, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      feature,
                      style: AppTextStyles.bodyMedium,
                    ),
                  ),
                ],
              ),
            )).toList(),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/services'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFeatured 
                      ? AppColors.goldAccent 
                      : Colors.transparent,
                  foregroundColor: isFeatured 
                      ? AppColors.deepBlack 
                      : AppColors.goldAccent,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: AppColors.goldAccent,
                      width: isFeatured ? 0 : 2,
                    ),
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: AppTextStyles.button.copyWith(
                    color: isFeatured 
                        ? AppColors.deepBlack 
                        : AppColors.goldAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopPricingTable() {
    return FadeInUp(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.goldAccent.withOpacity(0.3)),
        ),
        child: Table(
          border: TableBorder.symmetric(
            inside: BorderSide(color: AppColors.goldAccent.withOpacity(0.2)),
          ),
          children: [
            _buildTableHeader(),
            _buildTableRow('Photorealistic 3D Renders', true, true, true),
            _buildTableRow('Complete Blueprints (PDF)', false, true, true),
            _buildTableRow('Material Specifications', false, true, true),
            _buildTableRow('Structural Documentation', true, true, true),
            _buildTableRow('Dedicated Project Manager', false, false, true),
            _buildTableRow('24/7 Consultation Support', false, false, true),
            _buildTableRow('On-Site Visits', false, false, true),
            _buildTableRow('Lifetime Updates', true, true, true),
            _buildTableFooter(),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: BoxDecoration(
        color: AppColors.mediumGrey,
      ),
      children: [
        _buildHeaderCell('Features'),
        _buildHeaderCell('Visualization\n\$200,000'),
        _buildHeaderCell('Design Package\n\$300,000', isFeatured: true),
        _buildHeaderCell('Full Consultation\n\$500,000'),
      ],
    );
  }

  Widget _buildHeaderCell(String text, {bool isFeatured = false}) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: isFeatured ? AppColors.goldAccent.withOpacity(0.1) : null,
      ),
      child: Text(
        text,
        style: AppTextStyles.heading4.copyWith(
          fontSize: 18,
          color: isFeatured ? AppColors.goldAccent : AppColors.offWhite,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  TableRow _buildTableRow(String feature, bool col1, bool col2, bool col3) {
    return TableRow(
      children: [
        _buildFeatureCell(feature),
        _buildCheckCell(col1),
        _buildCheckCell(col2, isFeatured: true),
        _buildCheckCell(col3),
      ],
    );
  }

  Widget _buildFeatureCell(String text) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        text,
        style: AppTextStyles.bodyMedium,
      ),
    );
  }

  Widget _buildCheckCell(bool isIncluded, {bool isFeatured = false}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isFeatured ? AppColors.goldAccent.withOpacity(0.05) : null,
      ),
      child: Center(
        child: isIncluded
            ? Icon(
                Icons.check_circle,
                color: AppColors.goldAccent,
                size: 24,
              )
            : Icon(
                Icons.remove,
                color: AppColors.lightGrey,
                size: 24,
              ),
      ),
    );
  }

  TableRow _buildTableFooter() {
    return TableRow(
      children: [
        const SizedBox(),
        _buildCTACell('\$200,000', false),
        _buildCTACell('\$300,000', true),
        _buildCTACell('\$500,000', false),
      ],
    );
  }

  Widget _buildCTACell(String price, bool isFeatured) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: isFeatured ? AppColors.goldAccent.withOpacity(0.1) : null,
      ),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/services'),
        style: ElevatedButton.styleFrom(
          backgroundColor: isFeatured 
              ? AppColors.goldAccent 
              : Colors.transparent,
          foregroundColor: isFeatured 
              ? AppColors.deepBlack 
              : AppColors.goldAccent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: AppColors.goldAccent,
              width: isFeatured ? 0 : 2,
            ),
          ),
        ),
        child: Text(
          'Select Plan',
          style: AppTextStyles.button.copyWith(
            color: isFeatured 
                ? AppColors.deepBlack 
                : AppColors.goldAccent,
          ),
        ),
      ),
    );
  }

  Widget _buildGuaranteeSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      padding: EdgeInsets.all(isMobile ? 40 : 60),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.goldAccent.withOpacity(0.1),
            AppColors.deepBlack,
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.goldAccent.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          FadeInUp(
            child: Icon(
              Icons.verified_user,
              color: AppColors.goldAccent,
              size: 60,
            ),
          ),
          const SizedBox(height: 30),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Text(
              'Our Guarantee',
              style: isMobile ? AppTextStyles.heading3 : AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            delay: const Duration(milliseconds: 400),
            child: Text(
              'All services include lifetime access to updates and revisions',
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
              'We stand behind our work with comprehensive support and continuous improvement. Your satisfaction is our priority, and we\'re committed to delivering excellence at every stage.',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.offWhite.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        border: Border(
          top: BorderSide(color: AppColors.goldAccent.withOpacity(0.3)),
        ),
      ),
      child: Column(
        children: [
          FadeInUp(
            child: Text(
              'Frequently Asked Questions',
              style: isMobile ? AppTextStyles.heading3 : AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          _buildFAQItem(
            'What payment methods do you accept?',
            'We accept payments via Stripe, including all major credit cards, bank transfers, and cryptocurrency for international clients.',
          ),
          const SizedBox(height: 30),
          _buildFAQItem(
            'How long does each project take?',
            'Timeline varies by package: Visualization (4-6 weeks), Design Package (8-12 weeks), Full Consultation (16-24 weeks).',
          ),
          const SizedBox(height: 30),
          _buildFAQItem(
            'Can I upgrade my package later?',
            'Absolutely! You can upgrade at any time, and we\'ll credit your initial investment towards the new package.',
          ),
          const SizedBox(height: 30),
          _buildFAQItem(
            'Do you work internationally?',
            'Yes, we serve clients globally across 40+ countries with dedicated support in multiple languages and time zones.',
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return FadeInUp(
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: AppColors.mediumGrey,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.goldAccent.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.help_outline,
                  color: AppColors.goldAccent,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    question,
                    style: AppTextStyles.heading4.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 36),
              child: Text(
                answer,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.offWhite.withOpacity(0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
