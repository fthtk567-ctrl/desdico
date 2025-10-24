# 🚀 Vercel Deployment Guide - DESDICO

Complete step-by-step guide to deploy your Flutter Web app to Vercel.

## 📋 Prerequisites Checklist

- [ ] Flutter SDK installed (3.35.7 or higher)
- [ ] Git installed
- [ ] Vercel account created
- [ ] GitHub account (optional, but recommended)
- [ ] Node.js installed (for Vercel CLI)

## 🎯 Deployment Methods

### Method 1: GitHub + Vercel (RECOMMENDED) ⭐

This method provides automatic deployments on every push.

#### Step 1: Initialize Git

```powershell
cd c:\desdico\elite_architecture

# Initialize repository
git init

# Add all files
git add .

# First commit
git commit -m "Initial commit: Elite Architecture & Consultancy website"
```

#### Step 2: Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `desdico-website` or `elite-architecture`
3. Description: "Premium architecture consultancy website - desdico.com"
4. Choose **Public** or **Private**
5. **DON'T** initialize with README (you already have one)
6. Click "Create repository"

#### Step 3: Push to GitHub

```powershell
# Add GitHub remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/desdico-website.git

# Set branch name
git branch -M main

# Push to GitHub
git push -u origin main
```

#### Step 4: Deploy to Vercel

1. **Go to Vercel Dashboard**
   - Visit: https://vercel.com/dashboard
   - Login with GitHub

2. **Import Project**
   - Click "Add New..." → "Project"
   - Select "Import Git Repository"
   - Choose your repository: `desdico-website`

3. **Configure Project**
   - Framework Preset: **Other**
   - Root Directory: `./` (leave as default)
   - Build Command: `flutter build web --release --web-renderer canvaskit`
   - Output Directory: `build/web`
   - Install Command: Leave empty

4. **Environment Variables** (if needed)
   - Click "Environment Variables"
   - Add any required variables (e.g., API keys)

5. **Deploy**
   - Click "Deploy"
   - Wait 3-5 minutes for first deployment
   - ✅ Your site is live!

#### Step 5: Configure Custom Domain

1. **In Vercel Dashboard**
   - Go to your project
   - Click "Settings" → "Domains"

2. **Add Domain**
   - Type: `desdico.com`
   - Click "Add"
   - Vercel will show DNS instructions

3. **Update DNS (at your domain registrar)**

**For Root Domain (desdico.com):**
```
Type: A
Name: @
Value: 76.76.21.21
TTL: 3600
```

**For WWW (www.desdico.com):**
```
Type: CNAME
Name: www
Value: cname.vercel-dns.com
TTL: 3600
```

4. **Verify Domain**
   - Wait 5-48 hours for DNS propagation
   - Vercel will auto-detect and verify
   - SSL certificate issued automatically

---

### Method 2: Vercel CLI (Quick Deploy)

Use this for quick one-time deployments.

#### Step 1: Install Vercel CLI

```powershell
# Install globally
npm install -g vercel
```

#### Step 2: Build Flutter Web

```powershell
cd c:\desdico\elite_architecture

# Build for production
flutter build web --release --web-renderer canvaskit
```

#### Step 3: Login to Vercel

```powershell
vercel login
```

Choose login method (GitHub, GitLab, Bitbucket, or Email)

#### Step 4: Deploy

```powershell
# Production deployment
vercel --prod
```

Follow prompts:
- Set up and deploy? `Y`
- Which scope? Select your account
- Link to existing project? `N`
- Project name? `desdico-elite-architecture`
- Directory? `./` (press Enter)
- Override settings? `N`

✅ Deployment complete! You'll get a URL like: `https://desdico-elite-architecture.vercel.app`

---

## 🔄 Continuous Deployment (Auto-Deploy)

Once connected to GitHub, every push triggers auto-deployment:

```powershell
# Make changes to your code
# Then commit and push

git add .
git commit -m "Update: Added new feature"
git push origin main
```

Vercel automatically:
1. Detects the push
2. Builds the project
3. Deploys to production
4. Updates your live site

---

## 🌐 Domain Configuration Examples

### GoDaddy DNS Setup

1. Login to GoDaddy
2. Go to "My Products" → "DNS"
3. Add/Edit records:

```
Type: A, Name: @, Value: 76.76.21.21, TTL: 1 Hour
Type: CNAME, Name: www, Value: cname.vercel-dns.com, TTL: 1 Hour
```

### Namecheap DNS Setup

1. Login to Namecheap
2. Dashboard → Domain List → Manage → Advanced DNS
3. Add records:

```
Type: A Record, Host: @, Value: 76.76.21.21, TTL: Automatic
Type: CNAME, Host: www, Value: cname.vercel-dns.com, TTL: Automatic
```

### Cloudflare DNS Setup

1. Login to Cloudflare
2. Select your domain → DNS
3. Add records:

```
Type: A, Name: @, IPv4: 76.76.21.21, Proxy: ON
Type: CNAME, Name: www, Target: cname.vercel-dns.com, Proxy: ON
```

---

## ✅ Post-Deployment Checklist

After deployment, verify:

- [ ] Site loads at your domain
- [ ] All pages accessible (/, /about, /products, etc.)
- [ ] Navigation works correctly
- [ ] Footer links functional
- [ ] Images and logo display
- [ ] Responsive on mobile/tablet/desktop
- [ ] Contact form works
- [ ] SSL certificate active (HTTPS)
- [ ] No console errors

---

## 🔧 Troubleshooting

### Issue: Build Fails

**Solution:** Check Flutter version
```powershell
flutter --version
flutter upgrade
```

### Issue: Assets Not Loading

**Solution:** Verify `pubspec.yaml` assets section:
```yaml
flutter:
  assets:
    - assets/images/
```

### Issue: DNS Not Propagating

**Solution:** 
- Wait 24-48 hours
- Clear browser cache
- Check DNS: https://dnschecker.org

### Issue: 404 on Refresh

**Solution:** Already configured in `vercel.json`:
```json
"rewrites": [
  { "source": "/(.*)", "destination": "/index.html" }
]
```

---

## 📊 Performance Optimization

### Enable Compression
Already configured in `vercel.json` with cache headers.

### Optimize Images
```powershell
# Use optimized image formats
# Compress before uploading to assets/
```

### Monitor Performance
- Vercel Analytics (free tier available)
- Google PageSpeed Insights
- Lighthouse in Chrome DevTools

---

## 🔒 Security Best Practices

1. **Environment Variables**
   - Store API keys in Vercel Environment Variables
   - Never commit secrets to Git

2. **SSL/HTTPS**
   - Automatically enabled by Vercel
   - Force HTTPS in settings

3. **Headers**
   - Security headers already configured
   - CORS settings in `vercel.json`

---

## 📱 Mobile App Version

To create mobile apps from this codebase:

```powershell
# Android
flutter build apk --release

# iOS (requires macOS)
flutter build ios --release
```

---

## 📞 Support

Need help with deployment?

**Email**: info@desdico.com  
**Documentation**: https://vercel.com/docs  
**Flutter Web**: https://docs.flutter.dev/platform-integration/web

---

## 🎉 Success!

Your website is now live at **desdico.com**! 

Next steps:
1. ✅ Configure Paddle payment integration
2. ✅ Set up Google Analytics
3. ✅ Submit sitemap to Google Search Console
4. ✅ Monitor performance and user feedback

**Congratulations! 🚀**
