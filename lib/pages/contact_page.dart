import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_footer.dart';
import '../widgets/scroll_to_top_button.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final ScrollController _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _scrollController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
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
                _buildContactContent(context),
                _buildMapSection(context),
                const CustomFooter(),
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: ScrollToTopButton(scrollController: _scrollController),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      height: isMobile ? 350 : 400,
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
                  'Get in Touch',
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
                  'Let\'s discuss your next iconic project',
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

  Widget _buildContactContent(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 120,
      ),
      child: isMobile 
          ? Column(
              children: [
                _buildContactInfo(isMobile),
                const SizedBox(height: 60),
                _buildContactForm(isMobile),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: _buildContactForm(isMobile),
                ),
                const SizedBox(width: 60),
                Expanded(
                  flex: 3,
                  child: _buildContactInfo(isMobile),
                ),
              ],
            ),
    );
  }

  Widget _buildContactForm(bool isMobile) {
    return FadeInLeft(
      child: Container(
        padding: const EdgeInsets.all(40),
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Send us a Message',
                style: isMobile 
                    ? AppTextStyles.heading4
                    : AppTextStyles.heading3,
              ),
              const SizedBox(height: 30),
              _buildTextField(
                controller: _nameController,
                label: 'Full Name',
                hint: 'John Smith',
                icon: Icons.person_outline,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _emailController,
                label: 'Email Address',
                hint: 'john@example.com',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _messageController,
                label: 'Message',
                hint: 'Tell us about your project...',
                icon: Icons.message_outlined,
                maxLines: 6,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your message';
                  }
                  if (value.length < 10) {
                    return 'Message must be at least 10 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _handleSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.goldAccent,
                    foregroundColor: AppColors.deepBlack,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 8,
                  ),
                  child: _isSubmitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation(AppColors.deepBlack),
                          ),
                        )
                      : Text(
                          'Send Message',
                          style: AppTextStyles.button.copyWith(fontSize: 18),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          style: AppTextStyles.bodyMedium,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.offWhite.withOpacity(0.4),
            ),
            prefixIcon: Icon(icon, color: AppColors.goldAccent),
            filled: true,
            fillColor: AppColors.mediumGrey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.goldAccent.withOpacity(0.3)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.goldAccent.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.goldAccent, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo(bool isMobile) {
    return FadeInRight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Information',
            style: isMobile 
                ? AppTextStyles.heading4
                : AppTextStyles.heading3,
          ),
          const SizedBox(height: 30),
          _buildInfoCard(
            icon: Icons.location_on,
            title: 'Visit Us',
            content: 'Dilek Leyla LLC.\n1209 Mountain Road PL STE,N\nAlbuquerque, NM 87110 USA',
          ),
          const SizedBox(height: 20),
          _buildInfoCard(
            icon: Icons.email,
            title: 'Email',
            content: 'info@desdico.com\nsupport@desdico.com',
          ),
          const SizedBox(height: 20),
          _buildInfoCard(
            icon: Icons.phone,
            title: 'Phone',
            content: '+1 505 207 2084',
          ),
          const SizedBox(height: 20),
          _buildInfoCard(
            icon: Icons.access_time,
            title: 'Business Hours',
            content: 'Monday - Friday: 9:00 AM - 6:00 PM\nSaturday: 10:00 AM - 4:00 PM\nSunday: Closed',
          ),
          const SizedBox(height: 40),
          Text(
            'Follow Us',
            style: AppTextStyles.heading4.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 20),
          _buildSocialLinks(),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.goldAccent.withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.goldAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.goldAccent, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.goldAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: AppTextStyles.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      children: [
        _buildSocialButton(FontAwesomeIcons.linkedin),
        const SizedBox(width: 15),
        _buildSocialButton(FontAwesomeIcons.instagram),
        const SizedBox(width: 15),
        _buildSocialButton(FontAwesomeIcons.twitter),
        const SizedBox(width: 15),
        _buildSocialButton(FontAwesomeIcons.facebook),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.goldAccent.withOpacity(0.3)),
      ),
      child: FaIcon(
        icon,
        color: AppColors.goldAccent,
        size: 20,
      ),
    );
  }

  Widget _buildMapSection(BuildContext context) {
    // Map section removed
    return const SizedBox.shrink();
  }

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      setState(() => _isSubmitting = false);

      if (mounted) {
        // Show success message
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
                const Icon(Icons.check_circle, color: AppColors.goldAccent, size: 32),
                const SizedBox(width: 12),
                Text('Success!', style: AppTextStyles.heading4),
              ],
            ),
            content: Text(
              'Thank you for reaching out! We\'ll get back to you within 24 hours.',
              style: AppTextStyles.bodyMedium,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _nameController.clear();
                  _emailController.clear();
                  _messageController.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.goldAccent,
                  foregroundColor: AppColors.deepBlack,
                ),
                child: Text('Close', style: AppTextStyles.button),
              ),
            ],
          ),
        );
      }
    }
  }
}
