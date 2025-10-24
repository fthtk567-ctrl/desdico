# Flutter SDK Kurulum Rehberi (Windows)

## Hızlı Kurulum Adımları

### 1. Flutter SDK İndir

Aşağıdaki komutu PowerShell'de çalıştırın (Yönetici olarak):

```powershell
# Flutter SDK'yı indir
Invoke-WebRequest -Uri "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.3-stable.zip" -OutFile "$env:USERPROFILE\Downloads\flutter_sdk.zip"

# C:\ dizinine çıkart
Expand-Archive -Path "$env:USERPROFILE\Downloads\flutter_sdk.zip" -DestinationPath "C:\" -Force
```

### 2. PATH'e Ekle

```powershell
# Flutter'ı PATH'e ekle (Kalıcı)
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\flutter\bin", [EnvironmentVariableTarget]::Machine)

# Yeni bir PowerShell penceresi aç ve test et
flutter --version
```

### VEYA Manuel Kurulum:

1. **Flutter SDK İndir:**
   https://docs.flutter.dev/get-started/install/windows

2. **Zip dosyasını çıkart:** 
   `C:\flutter` klasörüne

3. **PATH'e ekle:**
   - Windows Arama → "environment variables"
   - System Properties → Environment Variables
   - System variables → Path → Edit
   - New → `C:\flutter\bin` ekle
   - OK ile kaydet

4. **PowerShell'i yeniden başlat**

### 3. Flutter Kurulumunu Tamamla

```powershell
# Doctor çalıştır (eksikleri gösterir)
flutter doctor

# Web desteğini etkinleştir
flutter config --enable-web

# Chrome'u varsayılan tarayıcı olarak ayarla
flutter config --enable-web
```

### 4. Projeyi Çalıştır

```powershell
cd c:\desdico\elite_architecture
flutter pub get
flutter run -d chrome
```

## Alternatif: Chocolatey ile Kurulum

Eğer Chocolatey yüklüyse:

```powershell
choco install flutter
```

## Hızlı Test

Kurulum sonrası test için:

```powershell
flutter doctor -v
flutter devices
flutter create test_app
cd test_app
flutter run -d chrome
```

---

## ⚠️ Şu An İçin

Flutter SDK olmadan projeyi çalıştıramayız. Lütfen yukarıdaki adımlardan birini izleyin.

Kurulum tamamlandıktan sonra:

```powershell
cd c:\desdico\elite_architecture
flutter pub get
flutter run -d chrome
```

komutlarıyla projeyi başlatabilirsiniz.

## 📞 Destek

Kurulum sırasında sorun yaşarsanız:
- Flutter resmi dokümantasyon: https://docs.flutter.dev/get-started/install/windows
- Video tutorial: YouTube'da "Flutter Windows kurulum" arayın
