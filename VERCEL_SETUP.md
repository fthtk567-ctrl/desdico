# 🚀 Vercel Serverless Functions - Stripe Kurulumu

## ✨ Neden Vercel?

✅ Zaten Vercel'de host ediyorsunuz  
✅ Ekstra kurulum gerektirmez  
✅ Otomatik deploy  
✅ Ücretsiz (100GB/ay yeterli)  
✅ Firebase'den daha basit!

---

## 📋 ADIM ADIM KURULUM

### 1️⃣ Vercel Dashboard'da Environment Variables Ekleyin

1. **Vercel Dashboard'a gidin:** [vercel.com](https://vercel.com)
2. Projenizi seçin: **desdico**
3. **Settings** → **Environment Variables** tıklayın

4. **İlk değişken:** Stripe Secret Key
   - **Name:** `STRIPE_SECRET_KEY`
   - **Value:** (Stripe Dashboard'dan aldığınız sk_live_... anahtarını yapıştırın)
   - **Environment:** Production, Preview, Development (hepsini seçin)
   - **Save**

5. **İkinci değişken:** Webhook Secret (şimdilik boş bırakabilirsiniz, daha sonra eklenecek)
   - **Name:** `STRIPE_WEBHOOK_SECRET`
   - **Value:** `boş` (Stripe webhook kurulumundan sonra ekleyeceğiz)
   - **Environment:** Production, Preview, Development
   - **Save**

---

### 2️⃣ API Klasörünü Kontrol Edin

✅ Zaten oluşturuldu:
- `api/create-checkout-session.js` - Ödeme oturumu oluşturur
- `api/stripe-webhook.js` - Stripe event'lerini dinler
- `api/package.json` - Dependencies

---

### 3️⃣ Git'e Push Edin

```powershell
cd c:\desdico\elite_architecture
git add .
git commit -m "Add Vercel Serverless Functions for Stripe payments"
git push origin main
```

**Vercel otomatik deploy edecek!** ✨

---

### 4️⃣ Deploy'u İzleyin

1. **Vercel Dashboard** → **Deployments** tıklayın
2. Son deployment'i açın
3. **Functions** sekmesine gidin
4. Şu URL'leri göreceksiniz:
   ```
   https://desdico.com/api/create-checkout-session
   https://desdico.com/api/stripe-webhook
   ```

✅ API'ler hazır! Başka bir şey yapmanıza gerek yok!

---

### 5️⃣ Stripe Webhook Yapılandırın

1. **Stripe Dashboard'a gidin:** [dashboard.stripe.com/webhooks](https://dashboard.stripe.com/webhooks)

2. **Add endpoint** tıklayın

3. **Endpoint URL:**
   ```
   https://desdico.com/api/stripe-webhook
   ```

4. **Events to send:** Şunları seçin:
   - ✅ `checkout.session.completed`
   - ✅ `payment_intent.succeeded`
   - ✅ `payment_intent.payment_failed`

5. **Add endpoint** tıklayın

6. **Signing secret** kopyalayın (whsec_... ile başlar)

7. **Vercel'e ekleyin:**
   - Vercel Dashboard → Settings → Environment Variables
   - `STRIPE_WEBHOOK_SECRET` değişkenini bulun
   - **Edit** tıklayın
   - Signing secret'i yapıştırın
   - **Save**

8. **Redeploy edin:**
   - Vercel Dashboard → Deployments
   - Son deployment'te **...** menüsü → **Redeploy**

---

## 🧪 TEST ETME

### 1. Yerel Test (İsteğe Bağlı)

```powershell
# Vercel CLI yükleyin
npm install -g vercel

# Projenize gidin
cd c:\desdico\elite_architecture

# Vercel dev sunucusunu başlatın
vercel dev
```

Tarayıcıda: `http://localhost:3000`

### 2. Canlı Test

1. **desdico.com** sitesine gidin
2. **Products** sayfasına gidin
3. **Buy Now** butonuna tıklayın
4. Stripe Checkout sayfası açılmalı!

**Test Kartı:**
```
Kart: 4242 4242 4242 4242
Tarih: 12/34 (gelecekteki herhangi bir tarih)
CVC: 123
ZIP: 12345
```

---

## ✅ İŞTE BU KADAR!

### Ne Yaptık?

1. ✅ Vercel'de 2 serverless function oluşturduk
2. ✅ Environment variables ekledik (secret key'ler)
3. ✅ Git'e push ettik → Otomatik deploy
4. ✅ Stripe webhook yapılandırdık
5. ✅ Sistem hazır! 🎉

### API Endpoint'leriniz:

```
POST https://desdico.com/api/create-checkout-session
POST https://desdico.com/api/stripe-webhook
```

### Ödeme Akışı:

```
1. Müşteri "Buy Now" tıklar
   ↓
2. Flutter → Vercel API çağırır
   ↓
3. Vercel → Stripe'a session oluşturur (secret key güvenli!)
   ↓
4. Stripe → Checkout sayfası açılır
   ↓
5. Müşteri → Ödeme yapar
   ↓
6. Stripe → Webhook ile bildiri gönderir
   ↓
7. Müşteri → Success/Failed sayfasına yönlendirilir
```

---

## 🎯 Önemli Notlar

### Güvenlik ✅
- Secret key **asla** frontend'de yok
- Sadece Vercel environment'da
- GitHub'da görünmez

### Maliyet 💰
- **Ücretsiz:** 100GB/ay bandwidth
- **Ücretsiz:** 100K function invocations/ay
- Sizin ihtiyacınızdan çok fazla!

### Monitoring 📊
- Vercel Dashboard → **Functions** → Logs
- Stripe Dashboard → **Events** → Tüm webhook event'leri

---

## 🛠️ Sorun Giderme

### "Function not found" hatası
- Vercel'de yeniden deploy edin
- `api/` klasörünün Git'te olduğunu kontrol edin

### "STRIPE_SECRET_KEY not defined" hatası
- Vercel → Settings → Environment Variables kontrol edin
- Redeploy yapın

### Webhook çalışmıyor
- Stripe Dashboard'da endpoint'in **enabled** olduğunu kontrol edin
- Webhook secret'in doğru girildiğini kontrol edin
- Vercel'de redeploy yapın

---

## 🎉 Tamamlandı!

Artık sisteminiz **TAM ÇALIŞIR** durumda!

**Test edin:**
1. desdico.com → Products
2. Buy Now tıklayın
3. Test kartı ile ödeme yapın
4. Success sayfasını görün!

**Başarılar!** 🚀

---

*DESDICO - Elite Architecture & Consultancy*  
*Dilek Leyla LLC. | Albuquerque, NM*
