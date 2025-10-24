import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_footer.dart';
import '../widgets/scroll_to_top_button.dart';
import '../widgets/floating_chat_button.dart';
import '../services/stripe_service.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isHovering1 = false;
  bool _isHovering2 = false;
  bool _isHovering3 = false;

  final List<Map<String, dynamic>> _services = [
    {
      'title': 'Elite Architectural Design Package',
      'price': '\$300,000',
      'description': 'Comprehensive PDF blueprints + 3D modeling for premium real estate projects.',
      'features': [
        'Complete architectural blueprints (PDF)',
        'High-resolution 3D modeling',
        'Material specifications',
        'Structural documentation',
        'Lifetime updates & revisions',
      ],
      'buttonText': 'Purchase via Stripe',
    },
    {
      'title': 'Premium Project Consultation',
      'price': '\$500,000',
      'description': 'Full-scale consultancy with expert project managers and architectural advisors.',
      'features': [
        'Dedicated project manager',
        'Expert architectural advisors',
        '24/7 consultation support',
        'On-site visits included',
        'Progress monitoring & reporting',
      ],
      'buttonText': 'Book Now',
    },
    {
      'title': 'Structural Visualization Package',
      'price': '\$200,000',
      'description': 'High-detail 3D visualization and structural documentation (PDF).',
      'features': [
        'Photorealistic 3D renders',
        'Virtual walkthrough videos',
        'Structural analysis reports',
        'Engineering documentation',
        'Multiple revision rounds',
      ],
      'buttonText': 'Order Package',
    },
  ];

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
                _buildServicesGrid(context),
                _buildProcessSection(context),
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
                  'Our Premium Services',
                  style: isMobile 
                      ? AppTextStyles.heading2.copyWith(fontSize: 36)
                      : AppTextStyles.heading1.copyWith(fontSize: 56),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.goldAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColors.goldAccent.withOpacity(0.3)),
                  ),
                  child: Text(
                    'Elite solutions for visionary projects',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.goldAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServicesGrid(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final isTablet = MediaQuery.of(context).size.width < 1200;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 120,
      ),
      child: isMobile
          ? Column(
              children: [
                _buildServiceCard(0, _services[0], isMobile),
                const SizedBox(height: 40),
                _buildServiceCard(1, _services[1], isMobile),
                const SizedBox(height: 40),
                _buildServiceCard(2, _services[2], isMobile),
              ],
            )
          : isTablet
              ? Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildServiceCard(0, _services[0], false)),
                        const SizedBox(width: 30),
                        Expanded(child: _buildServiceCard(1, _services[1], false)),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: _buildServiceCard(2, _services[2], false),
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildServiceCard(0, _services[0], false)),
                    const SizedBox(width: 30),
                    Expanded(child: _buildServiceCard(1, _services[1], false)),
                    const SizedBox(width: 30),
                    Expanded(child: _buildServiceCard(2, _services[2], false)),
                  ],
                ),
    );
  }

  Widget _buildServiceCard(int index, Map<String, dynamic> service, bool isMobile) {
    bool isHovering = index == 0 ? _isHovering1 : (index == 1 ? _isHovering2 : _isHovering3);
    bool isFeatured = index == 1; // Middle card is featured

    return FadeInUp(
      delay: Duration(milliseconds: index * 200),
      child: MouseRegion(
        onEnter: (_) => setState(() {
          if (index == 0) _isHovering1 = true;
          if (index == 1) _isHovering2 = true;
          if (index == 2) _isHovering3 = true;
        }),
        onExit: (_) => setState(() {
          if (index == 0) _isHovering1 = false;
          if (index == 1) _isHovering2 = false;
          if (index == 2) _isHovering3 = false;
        }),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.identity()..translate(0.0, isHovering ? -10.0 : 0.0),
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
                color: (isHovering || isFeatured) 
                    ? AppColors.goldAccent.withOpacity(0.3)
                    : AppColors.goldAccent.withOpacity(0.1),
                blurRadius: isHovering ? 30 : 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  service['title'],
                  style: isMobile 
                      ? AppTextStyles.heading4.copyWith(fontSize: 20)
                      : AppTextStyles.heading3.copyWith(fontSize: 28),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service['price'],
                      style: AppTextStyles.heading2.copyWith(
                        color: AppColors.goldAccent,
                        fontSize: isMobile ? 36 : 48,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  service['description'],
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.offWhite.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 30),
                Divider(color: AppColors.goldAccent.withOpacity(0.2)),
                const SizedBox(height: 30),
                ...List.generate(
                  service['features'].length,
                  (i) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: AppColors.goldAccent,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            service['features'][i],
                            style: AppTextStyles.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _handlePurchase(context, service),
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
                      elevation: isFeatured ? 8 : 0,
                    ),
                    child: Text(
                      service['buttonText'],
                      style: AppTextStyles.button.copyWith(
                        color: isFeatured 
                            ? AppColors.deepBlack 
                            : AppColors.goldAccent,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: TextButton.icon(
                    onPressed: () => _downloadDemoPDF(context, service['title']),
                    icon: const Icon(
                      Icons.download,
                      color: AppColors.goldAccent,
                      size: 18,
                    ),
                    label: Text(
                      'Download Demo PDF',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.goldAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProcessSection(BuildContext context) {
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
              'Our Process',
              style: isMobile ? AppTextStyles.heading3 : AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          isMobile
              ? Column(
                  children: [
                    _buildProcessStep('1', 'Consultation', 'Initial meeting to understand your vision'),
                    const SizedBox(height: 30),
                    _buildProcessStep('2', 'Design', 'Creating detailed plans and 3D models'),
                    const SizedBox(height: 30),
                    _buildProcessStep('3', 'Development', 'Bringing your project to life'),
                    const SizedBox(height: 30),
                    _buildProcessStep('4', 'Delivery', 'Complete documentation and support'),
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: _buildProcessStep('1', 'Consultation', 'Initial meeting to understand your vision')),
                    const SizedBox(width: 30),
                    Expanded(child: _buildProcessStep('2', 'Design', 'Creating detailed plans and 3D models')),
                    const SizedBox(width: 30),
                    Expanded(child: _buildProcessStep('3', 'Development', 'Bringing your project to life')),
                    const SizedBox(width: 30),
                    Expanded(child: _buildProcessStep('4', 'Delivery', 'Complete documentation and support')),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildProcessStep(String number, String title, String description) {
    return FadeInUp(
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.goldAccent, width: 2),
              color: AppColors.deepBlack,
            ),
            child: Center(
              child: Text(
                number,
                style: AppTextStyles.heading2.copyWith(
                  color: AppColors.goldAccent,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: AppTextStyles.heading4,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.offWhite.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Future<void> _handlePurchase(BuildContext context, Map<String, dynamic> service) async {
    try {
      // Extract price amount (remove $ and commas)
      final priceStr = service['price']!.replaceAll('\$', '').replaceAll(',', '');
      final priceInDollars = int.parse(priceStr);
      // Convert dollars to cents (Stripe requires cents)
      final amount = priceInDollars * 100;

      await StripeService.createCheckoutSession(
        productName: service['title']!,
        productDescription: service['description']!,
        amount: amount,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _downloadDemoPDF(BuildContext context, String packageName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.darkGrey,
        content: Row(
          children: [
            const Icon(Icons.download, color: AppColors.goldAccent),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Demo PDF for "$packageName" would download here',
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
