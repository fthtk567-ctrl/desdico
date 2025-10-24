import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_footer.dart';
import '../widgets/scroll_to_top_button.dart';
import '../widgets/floating_chat_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  int _currentCarouselIndex = 0;

  final List<Map<String, String>> _carouselItems = [
    {
      'title': 'Modern Luxury Villa',
      'description': 'Dubai, UAE',
    },
    {
      'title': 'Corporate Headquarters',
      'description': 'London, UK',
    },
    {
      'title': 'Sustainable Tower',
      'description': 'Singapore',
    },
    {
      'title': 'Cultural Center',
      'description': 'Paris, France',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startCarouselTimer();
  }

  void _startCarouselTimer() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _currentCarouselIndex = (_currentCarouselIndex + 1) % _carouselItems.length;
        });
        _startCarouselTimer();
      }
    });
  }

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
                _buildCarouselSection(context),
                _buildStatsSection(context),
                _buildFeaturesSection(context),
                _buildCTASection(context),
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
      height: size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.deepBlack,
            AppColors.darkGrey.withOpacity(0.8),
            AppColors.deepBlack,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background pattern
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Image.network(
                'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=1920',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.darkGrey,
                ),
              ),
            ),
          ),
          
          // Content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInDown(
                    duration: const Duration(milliseconds: 800),
                    child: Text(
                      'Global Premium Architecture',
                      style: isMobile 
                          ? AppTextStyles.heading2.copyWith(fontSize: 32)
                          : AppTextStyles.heading1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 200),
                    duration: const Duration(milliseconds: 800),
                    child: Text(
                      '& Project Consultancy',
                      style: isMobile 
                          ? AppTextStyles.heading2.copyWith(fontSize: 32, color: AppColors.goldAccent)
                          : AppTextStyles.heading1.copyWith(color: AppColors.goldAccent),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeInUp(
                    delay: const Duration(milliseconds: 400),
                    duration: const Duration(milliseconds: 800),
                    child: Text(
                      'Design excellence beyond imagination.',
                      style: isMobile 
                          ? AppTextStyles.bodyLarge.copyWith(fontSize: 16)
                          : AppTextStyles.bodyLarge.copyWith(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 60),
                  FadeInUp(
                    delay: const Duration(milliseconds: 600),
                    duration: const Duration(milliseconds: 800),
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: [
                        _buildCTAButton(
                          'Explore Services',
                          () => Navigator.pushNamed(context, '/services'),
                          isPrimary: true,
                        ),
                        _buildCTAButton(
                          'Book Consultation',
                          () => Navigator.pushNamed(context, '/contact'),
                          isPrimary: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                  FadeInUp(
                    delay: const Duration(milliseconds: 800),
                    duration: const Duration(milliseconds: 800),
                    child: Column(
                      children: [
                        Text(
                          'Scroll to explore',
                          style: AppTextStyles.bodySmall,
                        ),
                        const SizedBox(height: 10),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.goldAccent,
                          size: 32,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselSection(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 60 : 120),
      child: Column(
        children: [
          FadeInUp(
            child: Text(
              'Featured Projects',
              style: isMobile ? AppTextStyles.heading3 : AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Text(
              'Transforming visions into architectural masterpieces',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.offWhite.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          SizedBox(
            height: isMobile ? 300 : 500,
            child: PageView.builder(
              itemCount: _carouselItems.length,
              onPageChanged: (index) {
                setState(() {
                  _currentCarouselIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return _buildCarouselItem(_carouselItems[index], isMobile);
              },
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _carouselItems.length,
              (index) => _buildCarouselIndicator(index == _currentCarouselIndex),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(Map<String, String> item, bool isMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.goldAccent.withOpacity(0.2),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=1920',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.darkGrey,
                  child: const Icon(
                    Icons.architecture,
                    color: AppColors.goldAccent,
                    size: 100,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppColors.deepBlack.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 40,
                right: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: isMobile 
                          ? AppTextStyles.heading4
                          : AppTextStyles.heading3,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.goldAccent,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          item['description']!,
                          style: AppTextStyles.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.goldAccent : AppColors.lightGrey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
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
          bottom: BorderSide(color: AppColors.goldAccent.withOpacity(0.3)),
        ),
      ),
      child: isMobile 
          ? Column(
              children: [
                _buildStatItem('+250', 'Global Projects'),
                const SizedBox(height: 40),
                _buildStatItem('\$10B', 'Total Portfolio'),
                const SizedBox(height: 40),
                _buildStatItem('20 Years', 'of Excellence'),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('+250', 'Global Projects'),
                _buildStatItem('\$10B', 'Total Portfolio'),
                _buildStatItem('20 Years', 'of Excellence'),
              ],
            ),
    );
  }

  Widget _buildStatItem(String number, String label) {
    return FadeInUp(
      child: Column(
        children: [
          Text(
            number,
            style: AppTextStyles.heading1.copyWith(
              color: AppColors.goldAccent,
              fontSize: 56,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: AppTextStyles.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
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
              'Why Choose DESDICO?',
              style: isMobile ? AppTextStyles.heading3 : AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          isMobile
              ? Column(
                  children: [
                    _buildFeatureCard(
                      Icons.star,
                      'Award-Winning Design',
                      'International recognition for architectural excellence',
                    ),
                    const SizedBox(height: 30),
                    _buildFeatureCard(
                      Icons.public,
                      'Global Expertise',
                      'Projects delivered across 40+ countries',
                    ),
                    const SizedBox(height: 30),
                    _buildFeatureCard(
                      Icons.security,
                      'Premium Quality',
                      'Uncompromising standards in every detail',
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildFeatureCard(
                        Icons.star,
                        'Award-Winning Design',
                        'International recognition for architectural excellence',
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: _buildFeatureCard(
                        Icons.public,
                        'Global Expertise',
                        'Projects delivered across 40+ countries',
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: _buildFeatureCard(
                        Icons.security,
                        'Premium Quality',
                        'Uncompromising standards in every detail',
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, String description) {
    return FadeInUp(
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.goldAccent.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: AppColors.goldAccent.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.goldAccent, size: 60),
            const SizedBox(height: 20),
            Text(
              title,
              style: AppTextStyles.heading4,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              description,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.offWhite.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCTASection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 120,
      ),
      padding: EdgeInsets.all(isMobile ? 40 : 80),
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
            child: Text(
              'Ready to Start Your Project?',
              style: isMobile 
                  ? AppTextStyles.heading3.copyWith(fontSize: 28)
                  : AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Text(
              'Let\'s transform your vision into reality',
              style: AppTextStyles.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          FadeInUp(
            delay: const Duration(milliseconds: 400),
            child: _buildCTAButton(
              'Get Started Now',
              () => Navigator.pushNamed(context, '/contact'),
              isPrimary: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCTAButton(String text, VoidCallback onPressed, {required bool isPrimary}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? AppColors.goldAccent : Colors.transparent,
        foregroundColor: isPrimary ? AppColors.deepBlack : AppColors.goldAccent,
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: AppColors.goldAccent,
            width: isPrimary ? 0 : 2,
          ),
        ),
        elevation: isPrimary ? 8 : 0,
      ),
      child: Text(
        text,
        style: AppTextStyles.button.copyWith(
          fontSize: 18,
          color: isPrimary ? AppColors.deepBlack : AppColors.goldAccent,
        ),
      ),
    );
  }
}
