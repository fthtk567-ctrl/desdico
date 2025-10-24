# 🚀 VERCEL DEPLOYMENT - HIZLI BAŞLANGIÇ

## ADIM 1: GIT İLE BAŞLA

Terminalde şu komutları çalıştır:

```powershell
cd c:\desdico\elite_architecture
git init
git add .
git commit -m "Initial commit: DESDICO Elite Architecture website"
```

## ADIM 2: GITHUB'A YÜKLE

1. **GitHub'da yeni repository oluştur**: https://github.com/new
   - İsim: `desdico-website`
   - Public veya Private seç
   - README ekleme (zaten var)

2. **Repository'e push et**:
```powershell
git remote add origin https://github.com/KULLANICI_ADIN/desdico-website.git
git branch -M main  
git push -u origin main
```

## ADIM 3: VERCEL'E BAĞLA

1. **Vercel'e git**: https://vercel.com/login
2. **GitHub ile giriş yap**
3. **"Add New Project"** tıkla
4. **Repository'ni seç**: `desdico-website`
5. **Deploy** tıkla

## 🎉 BİTTİ!

3-5 dakika sonra siteniz yayında!

Vercel size bir URL verecek: `https://desdico-website.vercel.app`

---

## 🌐 KENDI DOMAİNİNİ BAĞLA (desdico.com)

### Vercel Dashboard'da:

1. Projen → **Settings** → **Domains**
2. Domain ekle: `desdico.com`
3. DNS ayarlarını göreceksin

### Domain sağlayıcında (GoDaddy, Namecheap, vs):

**A Kaydı:**
```
Type: A
Name: @
Value: 76.76.21.21
```

**CNAME Kaydı:**
```
Type: CNAME
Name: www
Value: cname.vercel-dns.com
```

### Bekle:
- DNS yayılması: 5-48 saat
- Vercel otomatik SSL verecek

---

## ✅ KONTROL LİSTESİ

- [ ] Git repository oluşturuldu
- [ ] GitHub'a push edildi
- [ ] Vercel'e bağlandı
- [ ] Site yayında
- [ ] Domain DNS ayarları yapıldı
- [ ] SSL aktif (https://)
- [ ] Tüm sayfalar çalışıyor

---

## 🔄 GÜNCELLEMEOtomatik deployment aktif!

```powershell
# Kod değiştir
# Sonra:
git add .
git commit -m "Güncelleme mesajı"
git push
```

Vercel otomatik deploy eder!

---

## 📞 YARDIM

**Deployment dokümanı**: DEPLOYMENT.md  
**Paddle setup**: PADDLE_SETUP.md  
**Email**: info@desdico.com

---

**Build durumu**: ✅ Başarılı! (`build/web` klasörü hazır)
