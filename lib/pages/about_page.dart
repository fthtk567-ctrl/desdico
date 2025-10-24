import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_footer.dart';
import '../widgets/scroll_to_top_button.dart';
import '../widgets/floating_chat_button.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> _teamMembers = [
    {
      'name': 'Dr. Alexander Sterling',
      'position': 'Chief Architect & Founder',
      'description': 'Harvard Graduate, 25+ years experience',
    },
    {
      'name': 'Victoria Chen',
      'position': 'Lead Design Director',
      'description': 'Award-winning sustainable architect',
    },
    {
      'name': 'Marcus Rodriguez',
      'position': 'Senior Project Consultant',
      'description': 'Specializing in luxury developments',
    },
  ];

  final List<Map<String, String>> _gallery = [
    {
      'title': 'Marina Bay Complex',
      'location': 'Singapore',
    },
    {
      'title': 'Sky Tower Residence',
      'location': 'Dubai',
    },
    {
      'title': 'Heritage Museum',
      'location': 'London',
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
                _buildPhilosophySection(context),
                _buildTeamSection(context),
                _buildGallerySection(context),
                _buildAchievementsSection(context),
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
      height: isMobile ? 400 : 600,
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
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Image.network(
                'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=1920',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.darkGrey,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInDown(
                    child: Text(
                      'About DESDICO',
                      style: isMobile 
                          ? AppTextStyles.heading2.copyWith(fontSize: 36)
                          : AppTextStyles.heading1.copyWith(fontSize: 56),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeInUp(
                    delay: const Duration(milliseconds: 200),
                    child: Text(
                      'Redefining architectural excellence since 2005',
                      style: isMobile 
                          ? AppTextStyles.bodyLarge
                          : AppTextStyles.bodyLarge.copyWith(fontSize: 24),
                      textAlign: TextAlign.center,
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

  Widget _buildPhilosophySection(BuildContext context) {
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
              'Our Philosophy',
              style: isMobile ? AppTextStyles.heading3 : AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Container(
              padding: const EdgeInsets.all(60),
              decoration: BoxDecoration(
                color: AppColors.darkGrey,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.goldAccent.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.format_quote,
                    color: AppColors.goldAccent,
                    size: 60,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Architecture is not structure;\nit\'s emotion shaped in concrete.',
                    style: isMobile 
                        ? AppTextStyles.heading4.copyWith(
                            fontSize: 24,
                            fontStyle: FontStyle.italic,
                            color: AppColors.goldAccent,
                          )
                        : AppTextStyles.heading3.copyWith(
                            fontStyle: FontStyle.italic,
                            color: AppColors.goldAccent,
                          ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'At DESDICO, we believe that every structure tells a story. Our approach combines cutting-edge design principles with timeless aesthetics, creating spaces that inspire, comfort, and endure. We don\'t just build buildings; we craft experiences that resonate with the human spirit.',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.offWhite.withOpacity(0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection(BuildContext context) {
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
              'Meet Our Team',
              style: isMobile ? AppTextStyles.heading3 : AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Text(
              'Visionaries behind extraordinary designs',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.offWhite.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          isMobile
              ? Column(
                  children: _teamMembers
                      .asMap()
                      .entries
                      .map((entry) => Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: _buildTeamMember(entry.value, entry.key),
                          ))
                      .toList(),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _teamMembers
                      .asMap()
                      .entries
                      .map((entry) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: _buildTeamMember(entry.value, entry.key),
                            ),
                          ))
                      .toList(),
                ),
        ],
      ),
    );
  }

  Widget _buildTeamMember(Map<String, String> member, int index) {
    return FadeInUp(
      delay: Duration(milliseconds: index * 200),
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.goldAccent, width: 3),
              color: AppColors.mediumGrey,
              boxShadow: [
                BoxShadow(
                  color: AppColors.goldAccent.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Icon(
              Icons.person,
              size: 100,
              color: AppColors.goldAccent,
            ),
          ),
          const SizedBox(height: 25),
          Text(
            member['name']!,
            style: AppTextStyles.heading4.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            member['position']!,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.goldAccent,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            member['description']!,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.offWhite.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildGallerySection(BuildContext context) {
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
              'Featured Projects',
              style: isMobile ? AppTextStyles.heading3 : AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          SizedBox(
            height: isMobile ? 300 : 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _gallery.length,
              itemBuilder: (context, index) {
                return _buildGalleryItem(_gallery[index], index, isMobile);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryItem(Map<String, String> item, int index, bool isMobile) {
    return FadeInRight(
      delay: Duration(milliseconds: index * 200),
      child: Container(
        width: isMobile ? 250 : 350,
        margin: const EdgeInsets.only(right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.goldAccent.withOpacity(0.2),
              blurRadius: 20,
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
                'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=800',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.darkGrey,
                  child: const Icon(
                    Icons.architecture,
                    color: AppColors.goldAccent,
                    size: 80,
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
                      AppColors.deepBlack.withOpacity(0.9),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 30,
                right: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: AppTextStyles.heading4,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.goldAccent,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          item['location']!,
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

  Widget _buildAchievementsSection(BuildContext context) {
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
              'Awards & Recognition',
              style: isMobile ? AppTextStyles.heading3 : AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          isMobile
              ? Column(
                  children: [
                    _buildAchievement('International Architecture Award', '2024'),
                    const SizedBox(height: 30),
                    _buildAchievement('Sustainable Design Excellence', '2023'),
                    const SizedBox(height: 30),
                    _buildAchievement('Best Luxury Project', '2022'),
                    const SizedBox(height: 30),
                    _buildAchievement('Global Design Innovation', '2021'),
                  ],
                )
              : Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildAchievement('International Architecture Award', '2024'),
                    _buildAchievement('Sustainable Design Excellence', '2023'),
                    _buildAchievement('Best Luxury Project', '2022'),
                    _buildAchievement('Global Design Innovation', '2021'),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildAchievement(String title, String year) {
    return FadeInUp(
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: AppColors.mediumGrey,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.goldAccent.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(
              Icons.emoji_events,
              color: AppColors.goldAccent,
              size: 50,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: AppTextStyles.heading4.copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              year,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.goldAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
