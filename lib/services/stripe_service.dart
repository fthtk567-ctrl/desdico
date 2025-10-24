import 'dart:convert';
import 'dart:js' as js;
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;

/// Stripe Service - Handles secure payment processing
/// Uses Vercel Serverless Functions backend to keep secret keys secure
class StripeService {
  // Vercel Serverless Function endpoint
  // This will be automatically available at /api/create-checkout-session
  static const String _backendUrl = 'https://desdico.com/api/create-checkout-session';
  
  // Success and Cancel URLs for Stripe Checkout
  static const String _successUrl = 'https://desdico.com/#/success';
  static const String _cancelUrl = 'https://desdico.com/#/failed';

  /// Creates a Stripe Checkout Session and redirects user to payment page
  /// 
  /// Parameters:
  /// - [productName]: Name of the product/service
  /// - [productDescription]: Detailed description
  /// - [amount]: Price in cents (e.g., 250000 = $2,500.00)
  /// - [currency]: Currency code (default: USD)
  /// 
  /// Returns true if successful, false otherwise
  static Future<bool> createCheckoutSession({
    required String productName,
    required String productDescription,
    required int amount,
    String currency = 'usd',
  }) async {
    try {
      // Call Vercel backend to create Stripe Checkout Session
      final response = await http.post(
        Uri.parse(_backendUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'productName': productName,
          'productDescription': productDescription,
          'amount': amount,
          'currency': currency,
          'successUrl': _successUrl,
          'cancelUrl': _cancelUrl,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final sessionId = data['sessionId'] as String;

        // Redirect to Stripe Checkout using Stripe.js
        if (kIsWeb) {
          _redirectToCheckout(sessionId);
          return true;
        } else {
          print('Stripe Checkout is only available on web platform');
          return false;
        }
      } else {
        print('Failed to create checkout session: ${response.statusCode}');
        print('Response: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error creating checkout session: $e');
      return false;
    }
  }

  /// Redirects to Stripe Checkout page using Stripe.js
  static void _redirectToCheckout(String sessionId) {
    js.context.callMethod('eval', [
      '''
      (async function() {
        const stripe = Stripe(window.STRIPE_PUBLISHABLE_KEY);
        const { error } = await stripe.redirectToCheckout({
          sessionId: '$sessionId'
        });
        if (error) {
          console.error('Stripe redirect error:', error);
          window.location.href = '${_cancelUrl}';
        }
      })();
      '''
    ]);
  }

  /// Format price for display (e.g., 250000 -> "$2,500.00")
  static String formatPrice(int cents) {
    final dollars = cents / 100;
    return '\$${dollars.toStringAsFixed(2).replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    )}';
  }
}
