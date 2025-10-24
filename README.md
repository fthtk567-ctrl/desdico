# Elite Architecture & Consultancy
## DESDICO - desdico.com

A premium, luxury-grade Flutter Web application for Elite Architecture & Consultancy firm.

## 🎯 Features

- **Premium Design**: Deep black background (#0A0A0B) with gold accents (#D4AF37)
- **Fully Responsive**: Optimized for desktop, tablet, and mobile devices
- **Material 3 Design**: Modern Flutter UI with smooth animations
- **Complete Pages**:
  - Home (Hero banner, carousel, stats, features)
  - About (Philosophy, team, gallery, awards)
  - Services (3 premium packages with Stripe-ready checkout)
  - Pricing (Comparison table, FAQ)
  - Contact (Form, map integration ready)
  - Legal pages (Terms, Privacy, Refund Policy)
  - Thank You page (Post-purchase)

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0+)
- Dart SDK
- Web browser for testing

### Installation

1. **Clone the repository**
```bash
cd c:\desdico\elite_architecture
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the application**
```bash
flutter run -d chrome
```

### Build for Production

```bash
flutter build web --release
```

The build output will be in `build/web/` directory.

## 📦 Packages Used

- `google_fonts` - Typography (Poppins & Inter)
- `animate_do` - Smooth animations
- `font_awesome_flutter` - Social media icons
- `url_launcher` - External link handling
- `flutter_svg` - SVG support
- `smooth_page_indicator` - Carousel indicators

## 💳 Payment Integration

The app is **Stripe-ready** with checkout buttons integrated. To activate:

1. Install `flutter_stripe` package
2. Add your Stripe publishable key
3. Configure backend webhook handlers
4. Update checkout flow in `services_page.dart`

## 🎨 Design System

### Colors
- **Deep Black**: `#0A0A0B`
- **Gold Accent**: `#D4AF37`
- **Off White**: `#F2F2F2`
- **Dark Grey**: `#1A1A1B`

### Typography
- **Headings**: Poppins (400-700)
- **Body**: Inter (400-600)

## 📱 Pages Structure

```
/                → Home Page
/about          → About Us
/services       → Service Packages
/pricing        → Pricing Table
/contact        → Contact Form
/terms          → Terms of Service
/privacy        → Privacy Policy
/refund         → Refund Policy
/thank-you      → Post-Purchase
```

## 🌐 Domain

**Primary Domain**: desdico.com
**Company**: Elite Architecture Ltd.
**Location**: London, United Kingdom
**Email**: info@desdico.com

## 📧 Contact Form Integration

To activate the contact form:

1. Set up **EmailJS** or **Firebase Functions**
2. Update form handler in `contact_page.dart`
3. Configure email templates

## 🗺️ Google Maps Integration

To add the map:

1. Get Google Maps API key
2. Add to `web/index.html`
3. Use `google_maps_flutter_web` package
4. Update map widget in `contact_page.dart`

## 🔒 Security Notes

- No API keys included in source code
- Add environment variables for production
- Configure CORS for backend services
- Implement rate limiting on contact form

## 📄 License

© 2025 Elite Architecture Ltd. All rights reserved.

## 🤝 Support

For support, email info@desdico.com or visit our contact page.

---

**Built with ❤️ using Flutter**
