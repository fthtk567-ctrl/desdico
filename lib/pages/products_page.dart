import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_footer.dart';
import '../widgets/scroll_to_top_button.dart';
import '../services/stripe_service.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >= 400 && !_showScrollButton) {
      setState(() => _showScrollButton = true);
    } else if (_scrollController.offset < 400 && _showScrollButton) {
      setState(() => _showScrollButton = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const CustomAppBar(),
                _buildHeroSection(),
                _buildProductsGrid(),
                const CustomFooter(),
              ],
            ),
          ),
          ScrollToTopButton(
            scrollController: _scrollController,
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.deepBlack,
            AppColors.darkGrey.withOpacity(0.5),
          ],
        ),
      ),
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Text(
              'Premium Products',
              style: AppTextStyles.heading1,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: Text(
              'Professional architectural blueprints, design packages, and consultation services',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.offWhite.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsGrid() {
    final isMobile = MediaQuery.of(context).size.width < 768;
    
    final products = [
      {
        'title': 'Premium Project Blueprint PDF',
        'description': 'Complete architectural blueprint package with detailed floor plans, elevations, and technical specifications.',
        'price': '\$2,500',
        'features': [
          'Detailed floor plans',
          'Elevation drawings',
          'Technical specifications',
          'Material schedules',
          '3D visualization renders',
        ],
      },
      {
        'title': 'Luxury Villa Design Package',
        'description': 'Comprehensive design package for high-end luxury villas with full documentation and consultation.',
        'price': '\$15,000',
        'features': [
          'Complete architectural plans',
          'Interior design concepts',
          'Landscape design',
          '3D walkthroughs',
          '6 months consultation',
        ],
      },
      {
        'title': 'Commercial Building Plans',
        'description': 'Full commercial building design with structural engineering and compliance documentation.',
        'price': '\$50,000',
        'features': [
          'Structural engineering',
          'MEP systems design',
          'Building code compliance',
          'Construction documentation',
          '1 year support',
        ],
      },
      {
        'title': 'Elite Master Planning',
        'description': 'Complete master planning service for large-scale developments and urban projects.',
        'price': '\$500,000',
        'features': [
          'Site analysis & planning',
          'Urban design concepts',
          'Infrastructure planning',
          'Sustainability analysis',
          'Full project management',
        ],
      },
    ];

    return Container(
      padding: EdgeInsets.all(isMobile ? 40 : 80),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isMobile ? 1 : 2,
          childAspectRatio: isMobile ? 0.8 : 0.75,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return FadeInUp(
            delay: Duration(milliseconds: 200 * index),
            child: _buildProductCard(products[index]),
          );
        },
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.goldAccent.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.goldAccent.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product['title'],
              style: AppTextStyles.heading3,
            ),
            const SizedBox(height: 15),
            Text(
              product['description'],
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.offWhite.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product['price'],
              style: AppTextStyles.heading2.copyWith(
                color: AppColors.goldAccent,
                fontSize: 36,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: (product['features'] as List).length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: AppColors.goldAccent,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            (product['features'] as List)[index],
                            style: AppTextStyles.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _handlePurchase(product),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.goldAccent,
                  foregroundColor: AppColors.deepBlack,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Buy Now',
                  style: AppTextStyles.button,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handlePurchase(Map<String, dynamic> product) async {
    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(color: AppColors.goldAccent),
              SizedBox(height: 16),
              Text(
                'Connecting to payment...',
                style: TextStyle(color: AppColors.offWhite),
              ),
            ],
          ),
        ),
      ),
    );

    try {
      // Extract price amount (remove $ and commas)
      final priceStr = product['price']!.replaceAll('\$', '').replaceAll(',', '');
      final priceInDollars = int.parse(priceStr);
      // Convert dollars to cents (Stripe requires cents)
      final amount = priceInDollars * 100;

      print('🛒 Processing purchase: ${product['title']}');
      print('💰 Price: \$${priceInDollars} = $amount cents');

      final success = await StripeService.createCheckoutSession(
        productName: product['title']!,
        productDescription: product['description'] ?? product['title']!,
        amount: amount,
      );

      // Close loading dialog
      if (mounted) Navigator.pop(context);

      if (!success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to connect to payment service. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      // Close loading dialog
      if (mounted) Navigator.pop(context);
      
      print('❌ Purchase error: $e');
      
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
}
