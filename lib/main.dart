import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'pages/products_page.dart';
import 'pages/services_page.dart';
import 'pages/pricing_page.dart';
import 'pages/contact_page.dart';
import 'pages/terms_page.dart';
import 'pages/privacy_page.dart';
import 'pages/refund_page.dart';
import 'pages/thank_you_page.dart';

void main() {
  runApp(const EliteArchitectureApp());
}

class EliteArchitectureApp extends StatelessWidget {
  const EliteArchitectureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DESDICO - Elite Architecture & Consultancy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.deepBlack,
        colorScheme: ColorScheme.dark(
          primary: AppColors.goldAccent,
          secondary: AppColors.goldAccent,
          surface: AppColors.darkGrey,
          background: AppColors.deepBlack,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.deepBlack,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/products': (context) => const ProductsPage(),
        '/services': (context) => const ServicesPage(),
        '/pricing': (context) => const PricingPage(),
        '/contact': (context) => const ContactPage(),
        '/terms': (context) => const TermsPage(),
        '/privacy': (context) => const PrivacyPage(),
        '/refund': (context) => const RefundPage(),
        '/thank-you': (context) => const ThankYouPage(),
      },
    );
  }
}
