# Paddle Payment Integration Guide

This guide explains how to integrate Paddle payment system for your Products page.

## Step 1: Create Paddle Account

1. Go to [paddle.com](https://paddle.com) and sign up
2. Complete business verification
3. Get your Vendor ID from the dashboard

## Step 2: Configure Paddle in Your App

### Update web/index.html

The Paddle.js script is already added. You need to:

```javascript
Paddle.Setup({ 
  vendor: YOUR_VENDOR_ID_HERE  // Replace 12345 with your actual Vendor ID
});
```

## Step 3: Create Products in Paddle Dashboard

1. Log in to [vendors.paddle.com](https://vendors.paddle.com)
2. Go to **Catalog > Products**
3. Create products matching your app:
   - Premium Project Blueprint PDF - $2,500
   - Luxury Villa Design Package - $15,000
   - Commercial Building Plans - $50,000
   - Elite Master Planning - $500,000
4. Note down each Product ID

## Step 4: Required URLs to Configure in Paddle

When setting up Paddle, you'll need to provide these URLs:

### Web Domain URLs
```
https://yourdomain.com
https://desdico.com
```

### Pricing Page URL
```
https://desdico.com/pricing
https://yourdomain.com/pricing
```

### Terms & Conditions URL
```
https://desdico.com/terms
https://yourdomain.com/terms
```

### Privacy Policy URL
```
https://desdico.com/privacy
https://yourdomain.com/privacy
```

### Refund Policy URL
```
https://desdico.com/refund
https://yourdomain.com/refund
```

### Contact/Support URL
```
https://desdico.com/contact
https://yourdomain.com/contact
```

## Step 5: Update Products Page

In `lib/pages/products_page.dart`, replace the product IDs:

```dart
// In _showPaddleInfo method, add:
void _launchPaddleCheckout(int productId, String productName) {
  // This will be called from JavaScript
  // Product IDs from your Paddle dashboard
}
```

## Step 6: Test Payments

1. Use Paddle's sandbox mode for testing
2. Test card: 4242 4242 4242 4242
3. Any future expiry date
4. Any CVV

## Step 7: Go Live

1. Complete Paddle business verification
2. Switch from sandbox to live mode
3. Update Vendor ID in production

## Important Notes

- All prices must be in USD
- Paddle handles tax calculations automatically
- PDFs should be delivered via webhook after successful payment
- Set up webhook URL in Paddle dashboard: `https://yourdomain.com/api/paddle-webhook`

## Contact Information for Paddle

Your business information (as shown on Paddle forms):

**Company Name**: Dilek Leyla LLC.

**Address**: 
```
1209 Mountain Road PL STE,N
Albuquerque, NM 87110
USA
```

**Contact Email**: info@desdico.com

**Support Email**: support@desdico.com

**Phone**: +1 505 207 2084

**Website**: https://desdico.com

## Legal Pages Status

✅ Terms of Service: `/terms` - Ready
✅ Privacy Policy: `/privacy` - Ready
✅ Refund Policy: `/refund` - Ready
✅ Contact Page: `/contact` - Ready
✅ Pricing Page: `/pricing` - Ready

All required pages are live and accessible!
